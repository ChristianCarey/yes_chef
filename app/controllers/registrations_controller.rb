class RegistrationsController < Devise::RegistrationsController

  def new
    # TODO determine default or redirect
    if params[:role] && ['chef', 'client'].include?(params[:role].downcase)
      @role = params[:role]
      super
    else
      flash[:danger] = ['Something went wrong...', 'Must select Chef or Client']
      redirect_to root_path
    end
  end

  private

    def sign_up_params
      params.require(:user).permit(:role, :email, :password, :password_confirmation)
    end
end
