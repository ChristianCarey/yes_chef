class Customer::OrdersController < ApplicationController

  before_action :find_order, except: [:index, :new, :create]
  before_action :find_menu, except: [:index, :show]
  before_action :require_chef

  def new
    @order = @menu.orders.build
    @oi = @order.order_items.build
  end

  def create
    @order = @menu.orders.build(whitelist)
    if @order.save
      flash[:success] = 'Order placed!'
      Order.send_receipt(@order.id)
      redirect_to @order
    else
      flash[:danger] = 'Unable to place order!'
      redirect_to new_customer_menu_order_path
    end
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

    def require_chef
      @menu.chef == current_user.chef
    end
end
