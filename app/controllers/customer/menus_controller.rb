class Customer::MenusController < ApplicationController

  before_action :find_menu, except: [:index]
  before_action :require_current_chef, except: [:index]

  def index
    @menus = current_user.chef.menus.all
    @completion_dates = @menus.group_by(&:completion_date)
    @order_deadlines = @menus.group_by(&:order_deadline)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
  end

  private
    def find_menu
      @menu = Menu.find_by(id: params[:id])
    end

    def require_current_chef
      unless customers_chef?(@menu)
        flash[:danger] = "Get outta my menu."
        redirect_to customer_menus
      end
    end
end
