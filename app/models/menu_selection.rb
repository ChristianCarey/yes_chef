class MenuSelection < ApplicationRecord
  belongs_to :menu_item
  belongs_to :menu, inverse_of: :menu_selections

  validates_uniqueness_of :menu_item_id, scope: :menu_id
end
