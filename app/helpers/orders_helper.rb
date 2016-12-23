module OrdersHelper

  def stringify_date(date)
    date.strftime("%A, %b %e")
  end

end
