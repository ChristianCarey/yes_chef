class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except:[:landing_page]

  def current_chef?(menu_or_item)
    current_user == menu_or_item.chef
  end
  helper_method :current_chef?

end
