class Profile < ApplicationRecord
  belongs_to :user

  before_save :fix_names

  validates_presence_of :first_name, :last_name

  validates_format_of :phone, with: /\A(?=.*\d)[EXT\#\:0-9\- +]+\Z/, allow_nil: true, allow_blank: true
  validates :phone, length: { minimum: 4, maximum: 30 }, allow_nil: true, allow_blank: true

  def name
    "#{first_name} #{last_name}"
  end

  private
    def fix_names
      first_name.capitalize! if first_name
      last_name.capitalize! if last_name
    end
end
