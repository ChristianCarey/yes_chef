module OrdersHelper

  def total_order_price(order)
    order.order_items.inject(0) do |total, oi|
      total += oi.sale_price_cents * oi.quantity
    end
  end
end
