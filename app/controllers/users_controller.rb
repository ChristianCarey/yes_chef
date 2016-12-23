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
