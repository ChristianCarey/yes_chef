class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    redirect_to(root_path) unless chef?
    @customers = current_user.customers
    @top_ten_customers = current_user.top_ten_customers
    @top_ten_menu_items = current_user.top_ten_menu_items
  end

  def show
    if @user.role == 'chef'
      redirect_to chef_menus_path
    else
      redirect_to customer_menus_path
    end
  end

  def current_user_home
    redirect_to current_user
  end

  def send_invite
    if chef?
      flash[:success] = "Invitation to #{params[:name] || params[:email]} sent!"
      User.send_invite(current_user, params[:email], params[:name])
    else
      flash[:danger] = "Only chefs can invite other users"
    end
    redirect_to :back
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
