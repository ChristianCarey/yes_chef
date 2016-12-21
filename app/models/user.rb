class User < ApplicationRecord

  has_many :menus

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
