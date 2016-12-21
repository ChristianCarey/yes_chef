class MenuItem < ApplicationRecord
  has_many :menu_selections
  has_many :menus, through: :menu_selections

  belongs_to :user, -> { where(:role, 'chef') }

  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:user_id]
end
