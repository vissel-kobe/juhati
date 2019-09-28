class UsersController < ApplicationController

  before_action :ensure_correct_user, {only: [:edit, :update, :unsubscribe, :delete]}

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def carts
    @user = User.find(params[:id])
    @orders = @user.orders.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def delete
    user = current_user
    user.deleted = "true"
    user.update(deleted: user.deleted)
    session[:user_id] = nil
    redirect_to '/'
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postcode, :address, :telephone, :email)
  end

  def ensure_correct_user
    @user  = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

end
