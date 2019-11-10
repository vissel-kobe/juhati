class OrdersController < ApplicationController

	def create
		@album = Album.find(params[:album_id])
		unless @album.in_cart?(current_user)
			order = Order.new(user_id: current_user.id, album_id: @album.id)
			order.subtotal = @album.price
			order.save!
			redirect_to user_carts_path(current_user)
		end
	end

	def update
		@order = Order.find(params[:id])
		@album = Album.find(params[:album_id])
		@user = User.find(@order.user_id)
		if @user != current_user
			redirect_to user_path(current_user)
		else
			new_number = params[:order][:number]
			if new_number.to_i > @album.stock
				flash[:danger] = "在庫数を超える購入はできません。"
				redirect_to user_carts_path(@user)
			else
				new_subtotal = (@album.price.to_i) * (new_number.to_i)
				if @order.update!(number: new_number, subtotal: new_subtotal)
					redirect_to user_carts_path(@user)
				end
			end
		end
	end

	def destroy
		@album = Album.find(params[:album_id])
		if @album.in_cart?(current_user)
			order = Order.find_by(user_id: current_user.id, album_id: @album.id)
			order.destroy
			redirect_to user_carts_path(current_user)
		end
	end

	private

end
