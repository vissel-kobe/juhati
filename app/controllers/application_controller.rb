class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path(current_admin.id)
    when User
      user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_family_name, :kana_first_name, :postcode, :address, :telephone, :email])
  end

  # def set_current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find_by(id: session[:user_id])
  #   if @current_user.deleted == "true"
  #     session[:user_id] = nil
  #     redirect_to '/'
  #   end
  # end

end
