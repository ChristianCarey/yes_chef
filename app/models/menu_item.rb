class MenuItem < ApplicationRecord
  before_save :file_or_url
  after_save :set_job

  has_many :menu_selections, dependent: :destroy
  has_many :menus, through: :menu_selections

  has_many :ingredients_menu_items, inverse_of: :menu_item, dependent: :destroy
  has_many :ingredients, through: :ingredients_menu_items, inverse_of: :menu_items

  has_many :categories_menu_items, inverse_of: :menu_item, dependent: :destroy
  has_many :categories, through: :categories_menu_items, inverse_of: :menu_items

  has_many :order_items, dependent: :nullify
  has_many :orders, through: :order_items

  has_attached_file :image, styles: {large: '500x500>', medium: '300x300>', thumb: "100x100>"}, default_url: "loading.svg"
  validates_attachment_content_type :image, content_type: /\Aimage.*\Z/
  process_in_background :image, processing_image_url: "loading.svg"
  before_post_process :randomize_file_name

  belongs_to :chef, class_name: "User", foreign_key: :user_id

  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: [:user_id]

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  def price=(price)
    self.price_cents = (price.to_f * 100)
  end

  def price
    (self.price_cents || 0).to_f / 100
  end

  def process_img
    p "procesing"
    PullTempfile.transaction(url: self.url, original_filename: "#{SecureRandom.hex}-#{File.basename(URI.parse(self.url).path).downcase}") do |tmp_image|
      self.image = tmp_image
      self.url = nil
      unless save
        messages = self.errors.full_messages.select {|e| e !~ /Paperclip/}
        messages << "Make sure you are using a web-safe image."
        self.destroy
      end
    end
  end

  private
    def randomize_file_name
      unless url && url != ""
        extension = File.extname(image_file_name).downcase
        self.image.instance_write(:file_name, "#{SecureRandom.hex}-#{image_file_name.downcase}")
      end
    end

    def file_or_url
      url = nil if url == ""
      image_file_name = File.basename(URI.parse(self.url).path) if url
      image = nil if url
    end

    def set_job
      if self.url && self.url != ""
        ProcessImageJob.perform_later self.id
      end
    end

end
