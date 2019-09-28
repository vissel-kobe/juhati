class OrdersController < ApplicationController

	before_action :set_album

	def create
		unless @album.in_cart?(current_user)
			order = Order.new(user_id: current_user.id, album_id: @album.id)
			order.subtotal = @album.price
			order.save!
			redirect_to user_carts_path(current_user)
			# 非同期にするなら以下
			# @album.reload
			# respond_to do |format|
			# 	format.js
			# end
		end
	end

	def update
		order = Order.find(params[:id])
		user = User.find(order.user_id)
		new_number = params[:order][:number]
		new_subtotal = (@album.price.to_i) * (new_number.to_i)
		if order.update!(number: new_number, subtotal: new_subtotal)
			redirect_to users_carts_path(user.id)
		end
	end

	def destroy
		if @album.in_cart?(current_user)
			order = Order.find_by(user_id: current_user.id, album_id: @album.id)
			order.destroy
			redirect_to user_carts_path(current_user)
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

end

