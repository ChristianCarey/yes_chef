class MenuItem < ApplicationRecord
  has_many :menu_selections, dependent: :destroy
  has_many :menus, through: :menu_selections
  belongs_to :chef, class_name: "User", foreign_key: :user_id
end
