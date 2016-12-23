class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    redirect_to(root_path) unless chef?
    @customers = current_user.customers
    @top_ten_customers = current_user.top_ten_customers
    @top_ten_menu_items = current_user.top_ten_menu_items
  end

  def show
  end

  def current_user_home
    redirect_to current_user
  end
  private

    def set_user
      @user = User.find(params[:id])
    end
end
