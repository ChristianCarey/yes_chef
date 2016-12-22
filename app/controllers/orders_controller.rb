class OrdersController < ApplicationController

  before_action :find_order, except: [:index, :new, :create]
  before_action :find_menu, except: [:index, :show]
  before_action :chef_or_current_user?

  def index
    @orders = @user.orders
  end

  def show
    # placed order
    # changing button: placed vs edit
  end

  def new
    @order = @menu.orders.build
    @oi = @order.order_items.build
  end

  def create
    @order = @menu.orders.build(whitelist)
    if @order.save
      flash[:success] = 'Order placed!'
      redirect_to @order
    else
      flash.now[:danger] = 'Unable to place order!'
      render :new
    end
  end

  def edit
    @oi = @order.order_items
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
      params.require(:order).permit( {order_items_attributes: [:quantity, :sale_price_cents, :menu_item_id ]} ).merge(customer: current_user)
    end

    def find_order
      @order = Order.find_by(id: params[:id])
    end

    def find_menu
      @menu = Menu.find_by(id: params[:menu_id])
    end
end
