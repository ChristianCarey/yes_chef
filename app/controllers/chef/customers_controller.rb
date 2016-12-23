class Chef::CustomersController < ApplicationController

  def show
    redirect_to(root_path) unless chef?
    @customers = current_user.customers
  end

end
