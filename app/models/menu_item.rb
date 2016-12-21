class MenuItem < ApplicationRecord
  has_many :menu_selections
  has_many :menus, through: :menu_selections
  has_many :ingredients_menu_items, inverse_of: :menu_item
  has_many :ingredients, through: :ingredients_menu_items, inverse_of: :menu_items
  belongs_to :chef, class_name: "User", foreign_key: :user_id
end
