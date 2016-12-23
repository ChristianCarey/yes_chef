class ProfilesController < ApplicationController

  before_action :require_current_user, except: [:show]

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(strong_profile_params)
    if @profile.save
      flash[:success] = 'Your profile has been succssfully created!'
      redirect_to user_profile_path(current_user)
    else
      # TODO descriptive
      flash[:danger] = "Profile not saved."
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end


  def update
    @profile = current_user.profile
    if @profile.update_attributes(strong_profile_params)
      flash[:success] = "Profile Updated!"
      redirect_to user_profile_path(current_user)
    else
      flash[:danger] = "Profile not updated. Try again."
      render action: :edit
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
  end

  private

    def strong_profile_params
      params.require(:profile).permit(:telephone, :address, :first_name, :last_name)
    end

    def require_current_user
      unless User.find(params[:user_id]) == current_user
        flash[:danger] = 'You may only edit your own profile'
        redirect_to current_user
      end
    end

end
