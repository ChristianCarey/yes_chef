class Menu < ApplicationRecord
  belongs_to :chef, class_name: 'User', foreign_key: :user_id

  has_many :menu_selections, inverse_of: :menu
  has_many :menu_items, through: :menu_selections

  accepts_nested_attributes_for :menu_selections

  validates :start_date, presence: true

  def self.add_menu_items(item_ids)

  end

end
