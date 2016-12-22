class MenuItem < ApplicationRecord
  has_many :menu_selections, dependent: :destroy
  has_many :menus, through: :menu_selections
  has_many :ingredients_menu_items, inverse_of: :menu_item
  has_many :ingredients, through: :ingredients_menu_items, inverse_of: :menu_items

  belongs_to :chef, class_name: "User", foreign_key: :user_id

  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: [:user_id]

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
end
