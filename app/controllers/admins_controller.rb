class AdminsController < ApplicationController
  def edit
  	@admin = current_admin
  end

  def show
  	@admin = current_admin
  end

  def update
  	@admin = current_admin
  	@admin.update(params_admin)
  	redirect_to admin_path(@admin)
  end

  private
  def params_admin
  	params.require(:admin).permit(:email)
  end
end
