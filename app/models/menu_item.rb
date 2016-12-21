class MenuItem < ApplicationRecord
  has_many :menu_selections
  has_many :menus, through: :menu_selections

  belongs_to :chef, -> { where(:role, 'chef') }, class_name: "User", foreign_key: :user_id

  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: [:user_id]
end
