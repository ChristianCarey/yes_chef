class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :ingredients_menu_items, inverse_of: :ingredient
  has_many :menu_items, through: :ingredients_menu_items, inverse_of: :ingredients
end
