class Order < ApplicationRecord
  belongs_to :menu, counter_cache: true
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  has_many :menu_item_orders, inverse_of: :order
  has_many :menu_items, through: :menu_item_orders

  default_scope { includes(:menu, :customer, :menu_items, :menu_item_orders) }

  accepts_nested_attributes_for :menu_item_orders, reject_if: :all_blank, reject_if: proc { |attributes| attributes['quantity'].blank? }

  def chef
    menu.chef
  end

  def total
    menu_item_orders.sum(:sale_price_cents)
  end
end
