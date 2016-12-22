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
    @menu = Menu.find(params[:menu_id])
    @order = Order.new
    @mio = MenuItemOrder.new
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @order = current_user.placed_orders.build(whitelist)
    @order.chef_id = @menu.chef.id
    if @order.save
      flash[:success] = 'Order placed!'
      # TODO make show
      redirect_to @menu
    else
      nil.ok
    end
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
      params.require(:order).permit( {menu_item_orders_attributes: [:quantity, :sale_price_cents, menu_item_ids: [] ]} )
    end

    def find_order
      @order = Order.find_by_id(params[:id])
    end
end
