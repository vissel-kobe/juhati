class AdminsController < ApplicationController

  before_action :set_admin

  def show
  end

  def edit
  end

  def update
  	@admin = current_admin
  	@admin.update(admin_params)
  	redirect_to admin_path(@admin)
  end

  private

  def set_admin
    @admin = current_admin
  end

  def admin_params
  	params.require(:admin).permit(:email)
  end

end
