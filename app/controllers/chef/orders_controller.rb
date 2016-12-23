class Chef::OrdersController < ApplicationController
  def show
    @orders = current_user.recieved_orders
  end
end
