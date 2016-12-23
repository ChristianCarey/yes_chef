class RegistrationsController < Devise::RegistrationsController

  def new
    # TODO determine default or redirect
    if params[:role] && ['chef', 'customer'].include?(params[:role].downcase)
      @role = params[:role]
      super
    else
      flash[:danger] = ['Something went wrong...', 'Must select Chef or Customer']
      redirect_to root_path
    end
  end

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation, :chef_id)
    end
end
