class CategoriesMenuItem < ApplicationRecord
  belongs_to :category, inverse_of: :categories_menu_items
  belongs_to :menu_item, inverse_of: :categories_menu_items
end
