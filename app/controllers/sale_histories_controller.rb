class SaleHistoriesController < ApplicationController

  before_action :ensure_correct_user, {only: [:hidden])

  def index
    if params[:id]
      @user = User.find(params[:id])
      @histories = SaleHistory.where(user_id: @user.id, deleted: nil).page(params[:page]).reverse_order
      @title = "購入"
    else
      @histories = SaleHistory.page(params[:page]).reverse_order
      @title = "販売"
    end
  end

  def create
  end

  def change_status
    history = SaleHistory.find(params[:id])
    history.update(status: params[:sales_history][:status])
    redirect_to histories_path
  end

  def hidden
    history = SaleHistory.find(params[:id])
    history.update(deleted: "true")
    redirect_to user_history_path(user)
  end

  private

  def ensure_correct_user
    user  = User.find(params[:user_id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end

end
