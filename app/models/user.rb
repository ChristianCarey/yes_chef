class User < ApplicationRecord

  has_many :menus, dependent: :destroy
  has_many :menu_items, dependent: :destroy

  has_many :ingredients

  has_many :received_orders, class_name: 'Order', foreign_key: :chef_id
  has_many :placed_orders, class_name: 'Order', foreign_key: :customer_id

  has_many :menu_item_orders, through: :placed_orders
  
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
