class OrdersController < ApplicationController

  before_action :find_order, except: [:index, :new, :create]

  def index
    @orders = current_user.orders
  end

  def show
    # placed order
    # changing button: placed vs edit
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new()
    @mio = MenuItemOrder.new
    @order.save
  end

  def edit

  end

  def update
    # orders that are sitll active (before certain date)
  end

  def destroy
    # orders that are still active only
    # add a fulfilled_date col to Order?
  end

  private

    def whitelist
      params.require(:order).permit(:chef_id, menu_item_ids: [])
    end

    def find_order
      @order = Order.find_by_id(params[:id])
    end
end
