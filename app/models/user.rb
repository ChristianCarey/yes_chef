class User < ApplicationRecord

  has_many :menus
  has_many :menu_items

  has_many :ingredients

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
