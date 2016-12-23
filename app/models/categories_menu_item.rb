class CategoriesMenuItem < ApplicationRecord
  belongs_to :category, counter_cache: true, inverse_of: :categories_menu_items
  belongs_to :menu_item, inverse_of: :categories_menu_items

  validates_uniqueness_of :category_id, scope: :menu_item_id
end
