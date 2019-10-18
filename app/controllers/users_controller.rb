class UsersController < ApplicationController

  before_action :ensure_correct_user, {only: [:edit, :carts, :update, :unsubscribe, :destroy]}
  before_action :set_user, {only: [:show, :favorites]}

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def carts
    @orders = @user.orders.all
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
  end

# deleteにしたかったけどエラーでたので一旦
  def destroy
    @user.update(deleted: "true")
    current_user = nil
    @current_user = nil
    reset_session
    redirect_to root_path
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user.id)
  end

  private

  def ensure_correct_user
    @user  = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postcode, :address, :telephone, :email)
  end

end
