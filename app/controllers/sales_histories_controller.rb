class SalesHistoriesController < ApplicationController

  before_action :ensure_correct_user, {only: [:hidden]}
  before_action :set_correct_cart, {only: [:new]}

  def index
    @user = User.find(params[:user_id])
    @histories = SalesHistory.where(user_id: params[:user_id], deleted: nil).page(params[:page]).reverse_order
  end

  def new
    @sales_history = SalesHistory.new
  end

  def create
    @user  = User.find(params[:user_id])
    @sales_history = SalesHistory.new(sales_history_params)
    if @user != current_user
      redirect_to user_path(current_user)
    else
      @cart_items = @user.orders.all
      @total = 500
      @error_albums = []
      i = 0
      @cart_items.each do |cart_item|
        cart_album = Album.find(cart_item.album_id)
        if cart_item.number > cart_album.stock
          @error_albums << cart_album
        end
        @total += cart_item.subtotal
      end
      if @error_albums != []
        # @error_albumsの中身がある時
        render 'users/carts'
      else
        if @sales_history.save
          @cart_items.each do |cart_item|
            cart_album = Album.find(cart_item.album_id)
            history_item = HistoryItem.new(
              sales_history_id: @sales_history.id,
              album_id: cart_album.id,
              album_title: cart_album.title,
              album_price: cart_album.price,
              quantity: cart_item.number)
            history_item.save
            newstock = cart_album.stock - history_item.quantity
            if newstock > 0
              cart_album.update(stock: newstock)
            else
              cart_album.update(stock: newstock, status: 0)
            end
          end
          @cart_items.delete_all
          redirect_to thanks_path
        else
          # @sales_historyのsave失敗時
          render 'new'
        end
      end
    end
  end

  def hidden
    history = SalesHistory.find(params[:id])
    history.update(deleted: "true")
    redirect_to user_histories_path(@user)
  end

  private

  def ensure_correct_user
    @user  = User.find(params[:user_id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def set_correct_cart
    @user  = User.find(params[:user_id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      @cart_items = @user.orders.all
      @total = 500
      @cart_items.each do |cart_item|
        @total += cart_item.subtotal
      end
    end
  end

  def sales_history_params
    params.require(:sales_history).permit(:user_id, :shipping_address_id, :total)
  end

end
