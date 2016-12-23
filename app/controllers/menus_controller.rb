class MenusController < ApplicationController

  def index
    if chef?
      redirect_to chef_menus_path
    else
      redirect_to customer_menus_path
    end
  end

end
