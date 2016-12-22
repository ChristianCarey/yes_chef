class OrdersController < ApplicationController

  before_action :find_order, except: [:index, :new, :create]
  before_action :find_menu, except: [:index, :show]

  def index
    @orders = current_user.orders
  end

  def show
    # placed order
    # changing button: placed vs edit
  end

  def new
    @order = @menu.orders.build
    @mio = @order.menu_item_orders.build
  end

  def create
    @order = @menu.orders.build(whitelist)
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
      params.require(:order).permit( {menu_item_orders_attributes: [:quantity, :sale_price_cents, :menu_item_id ]} ).merge(customer: current_user)
    end

    def find_order
      @order = Order.find_by(id: params[:id])
    end

    def find_menu
      @menu = Menu.find_by(id: params[:menu_id])
    end
end
