class OrdersController < ApplicationController

	before_action :set_album
	before_action :ensure_correct_user, {only: [:update])

	def create
		unless @album.in_cart?(current_user)
			order = Order.new(user_id: current_user.id, album_id: @album.id)
			order.subtotal = @album.price
			order.save!
			redirect_to users_carts_path(current_user)
		end
	end

	def update
		new_number = params[:order][:number]
		new_subtotal = (@album.price.to_i) * (new_number.to_i)
		if @order.update!(number: new_number, subtotal: new_subtotal)
			redirect_to users_carts_path(user)
		end
	end

	def destroy
		if @album.in_cart?(current_user)
			order = Order.find_by(user_id: current_user.id, album_id: @album.id)
			order.destroy
			redirect_to users_carts_path(current_user)
		end
	end

	private

	def set_album
		@album = Album.find(params[:album_id])
	end

	def ensure_correct_user
		@order = Order.find(params[:id])
		if @order.user_id != current_user.id
			redirect_to user_path(current_user)
		end
	end

end
