class OrdersController < ApplicationController

	before_action :set_album

	def create
		unless @album.in_cart?(current_user)
			order = Order.new(user_id: current_user.id, album_id: @album.id)
			order.subtotal = @album.price
			order.save!
			redirect_to users_carts_path(current_user)
			# 非同期にするなら以下
			# @album.reload
			# respond_to do |format|
			# 	format.js
			# end
		end
	end

	def update
		order = Order.find_by(user_id: current_user.id, album_id: @album.id)
		if order.update!(order.params)
			redirect_to users_carts_path(current_user)
		end
	end

	def destroy
		if @album.in_cart?(current_user)
			order = Order.find_by(user_id: current_user.id, album_id: @album.id)
			order.destroy
			redirect_to users_carts_path(current_user)
			# 非同期にするなら以下
			# @album.reload
			# respond_to do |format|
			# 	format.js
			# end
		end
	end

	private

	def set_album
		@album = Album.find(params[:album_id])
	end

	def order_params
	    params.require(:user).permit(:user_id, :album_id, :subtotal, :number)
	end

end
