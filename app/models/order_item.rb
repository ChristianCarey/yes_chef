class OrderItem < ApplicationRecord

  belongs_to :menu_item, inverse_of: :order_items
  belongs_to :order, inverse_of: :order_items

  validates :quantity, numericality: { greater_than: 0, only_integer: true }

  validates_uniqueness_of :menu_item, scope: :order

  before_create :set_calculated_fields

  def menu_item_total_price
    self.quantity * self.menu_item.price_cents
  end

  private
    def set_calculated_fields
      set_item_name
      calculate_sale_price
    end

    def set_item_name
      self.item_name = menu_item.name
    end

    def calculate_sale_price
      self.sale_price_cents = menu_item.price_cents
    end

end
