class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except:[:landing_page]

  def find_user
    @user = User.find_by(id: params[:user_id]) || @order.customer
  end

  def current_chef?(menu_or_item)
    current_user == menu_or_item.chef
  end
  helper_method :current_chef?

  def customers_chef?(menu_or_item)
    current_user.chef == menu_or_item.chef
  end
  helper_method :customers_chef?

  def chef_or_current_user?
    @user == current_user || @user.chef == current_user
  end

  def chef?
    user_signed_in? ? current_user.role == 'chef' : false
  end
  helper_method :chef?

  def require_chef
    unless chef?
      flash[:error] = "Only a chef can do that."
      redirect_to :root
    end
  end
end
