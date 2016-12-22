class Order < ApplicationRecord
  belongs_to :chef, class_name: 'User', foreign_key: :chef_id
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  has_many :menu_item_orders
  has_many :menu_items, through: :menu_item_orders

  validates :chef_id, :customer_id, presence: true
end
