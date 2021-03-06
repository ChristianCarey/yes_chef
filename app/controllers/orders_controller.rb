class OrdersController < ApplicationController

  before_action :find_order, except: [:index]
  before_action :find_menu, except: [:index]
  before_action :find_user
  before_action :chef_or_current_user?

  def index
    @orders = @user.placed_orders
  end

  def show
  end

  private

    def find_order
      @order = Order.find_by(id: params[:id])
    end

    def find_menu
      @menu = Menu.find_by(id: params[:menu_id])
    end

end
