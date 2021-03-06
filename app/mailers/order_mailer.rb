class OrderMailer < ApplicationMailer
  default from: "backofhouse@yeschef.com"

  def receipt(order)
    @title = "New Order Placed"
    @order = order
    @customer = @order.customer
    @chef = @customer.chef
    mail(to: @customer.email, subject: "Dinner is on it's way!")
  end

  def order_to_chef(order)
    @title = "New Order Placed"
    @order = order
    @customer = order.customer
    @chef = @customer.chef
    mail(to: @chef.email, subject: "#{@customer.name} is hungry.")
  end
end
