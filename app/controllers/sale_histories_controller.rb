class SaleHistoriesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def create
  end

  def change_status
  end

  def hidden
  end
end
