class Chef::CustomersController < ApplicationController

  def show
    redirect_to(root_path) unless chef?
    @customers = current_user.customers.order(placed_orders_count: :desc)
  end

end
