class Admins::SalesHistoriesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @histories = @user.sales_history.page(params[:page]).reverse_order
    else
      @histories = SalesHistory.page(params[:page]).reverse_order
    end
  end

  def update
    @history = SalesHistory.find(params[:id])
    @history.update(status: params[:sales_history][:status])
    redirect_to admins_sales_histories_path
  end

  private

end
