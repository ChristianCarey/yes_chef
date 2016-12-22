class Order < ApplicationRecord
  belongs_to :chef, class_name: 'User', foreign_key: :chef_id
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  has_many :menu_item_orders, inverse_of: :order
  has_many :menu_items, through: :menu_item_orders

  accepts_nested_attributes_for :menu_item_orders
end
