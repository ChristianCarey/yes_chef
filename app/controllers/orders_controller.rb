class OrdersController < ApplicationController

  before_action :find_order, except: [:index, :new, :create]
  before_action :find_menu, except: [:index, :show]

  def index
    @orders = current_user.placed_orders
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

  # def edit
  #   @oi = @order.order_items
  # end

  # def update
  #
  #   # orders that are sitll active (before order_deadline)
  # end

  # def destroy
  #   # orders that are still active only
  #   # add a fulfilled_date col to Order?
  # end

  private

    def whitelist
      params.require(:order).permit(:id, :menu_id, {order_items_attributes: [:id, :quantity, :menu_item_id ]} ).merge(customer: current_user)
    end

    def find_order
      @order = Order.find_by(id: params[:id])
    end

    def find_menu
      @menu = Menu.find_by(id: params[:menu_id])
    end
end
