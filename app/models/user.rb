class User < ApplicationRecord

  has_many :menus

  has_many :menu_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
