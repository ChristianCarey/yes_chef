module MenuHelper
  def already_ordered_completion(date)
    current_user.placed_orders.select { |o| o.menu.completion_date == date }
  end

  def already_ordered_deadline(date)
    current_user.placed_orders.any? { |o| o.menu.order_deadline == date }
  end
end
