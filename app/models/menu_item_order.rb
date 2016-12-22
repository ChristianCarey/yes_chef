class MenuItemOrder < ApplicationRecord
  belongs_to :menu_item, inverse_of: :menu_item_orders
  belongs_to :order, inverse_of: :menu_item_orders

  validates :quantity, :sale_price_cents, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates_uniqueness_of :menu_item, scope: :order

  before_create :calculate_sale_price

  private

    def calculate_sale_price
      self.sale_price_cents = menu_item.price_cents
    end
end
