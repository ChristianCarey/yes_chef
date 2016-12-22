class IngredientsMenuItem < ApplicationRecord
  belongs_to :ingredient, inverse_of: :ingredients_menu_items
  belongs_to :menu_item, inverse_of: :ingredients_menu_items

  validates_uniqueness_of :ingredient_id, scope: :menu_item_id

end
