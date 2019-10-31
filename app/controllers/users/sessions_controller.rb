# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_deleted_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

   def reject_deleted_user
    @user = User.find_by(email: params[:user][:email], deleted: "true")
    if @user
      flash[:danger] = "お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。"
      redirect_to new_user_session_path
    end
   end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
