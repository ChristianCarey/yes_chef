class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    redirect_to(root_path) unless chef?
    @customers = current_user.customers
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
