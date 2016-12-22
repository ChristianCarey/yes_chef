class User < ApplicationRecord

  has_many :menus, dependent: :destroy
  has_many :menu_items, dependent: :destroy

  has_many :ingredients

  validate :correct_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
    def correct_role
      unless ["chef", "user"].include?(role)
        errors.add(:role, :invalid, message: "Don't try to hack our system")
      end
    end
end
