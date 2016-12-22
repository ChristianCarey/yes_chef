class Category < ApplicationRecord
  has_many :categories_menu_items, inverse_of: :category
  has_many :menu_items, through: :categories_menu_items, inverse_of: :categories

  validates_uniqueness_of :name
end
