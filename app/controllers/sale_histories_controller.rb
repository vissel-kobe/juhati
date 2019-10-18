class SaleHistoriesController < ApplicationController

  before_action :ensure_correct_user, {only: [:hidden])

  def index
    if params[:id]
      @histories = SalesHistory.where(user_id: params[:id])
    else
      @hitories = SalesHistory.all
    end
  end

  def show
  end

  def create
  end

  def change_status
    history = SalesHistory.find(params[:id])
    history.update(status: params[:sales_history][:status])
    redirect_to histories_path
  end

  def hidden
    history = SalesHistory.find(params[:id])
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
