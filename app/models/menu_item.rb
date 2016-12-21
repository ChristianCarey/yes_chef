class MenuItem < ApplicationRecord
  has_many :menu_selections
  has_many :menus, through: :menu_selections
end
