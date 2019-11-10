class Admins::UsersController < ApplicationController

  before_action :set_user, {only: [:show, :edit, :update, :favorites, :unsubscribe, :destroy]}

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  def unsubscribe
  end

# deleteにしたかったけどエラーでたので一旦
  def destroy
    @user.update(deleted: "true")
    redirect_to admins_users_path
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id)
    @album_ids = []
    @favorites.each do |fav|
      @album_ids << fav.album.id
    end
    @album = Album.where(id: @album_ids).page(params[:page]).per(12).reverse_order
    @page_title = @user.first_name + "さんがいいねした商品"
    render 'admins/albums/index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postcode, :address, :telephone, :email)
  end

end
