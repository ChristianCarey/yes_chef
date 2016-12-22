class MenuItemOrder < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order, inverse_of: :menu_item_orders

  validates :menu_item_id, :order_id, :quantity, :sale_price_cents, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
end
