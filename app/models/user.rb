class User < ApplicationRecord

  has_many :menus, dependent: :destroy
  has_many :menu_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
