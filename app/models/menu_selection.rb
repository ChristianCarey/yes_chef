class MenuSelection < ApplicationRecord
  belongs_to :menu_item
  belongs_to :menu, inverse_of: :menu_selections


end
