class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def carts
  end

  def update
    @user = User.find(params[:id])
    @user.update
  end

  def unsubscribe
  end

  private
  def user_params
    params.require(:user).permit()
  end
end
