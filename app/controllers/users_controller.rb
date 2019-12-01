class UsersController < ApplicationController

  before_action :ensure_correct_user, {only: [:show, :edit, :carts, :update, :favorites, :unsubscribe, :destroy]}

  def show
  end

  def edit
  end

  def carts
    @user = User.find(params[:id])
    @orders = @user.orders.all
    @sale = SalesHistory.new
    @cart_items = @user.orders.all

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
    @favorites = Favorite.where(user_id: @user.id)
    @album_ids = []
    @favorites.each do |fav|
      @album_ids << fav.album_id
    end
    @albums = Album.where(id: @album_ids).page(params[:page]).per(12).reverse_order
    @page_title = "いいねした商品"
    render 'albums/index'
  end

  private

  def ensure_correct_user
    @user  = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postcode, :address, :telephone, :email)
  end

end
