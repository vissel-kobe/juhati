class ShippingAddressesController < ApplicationController

	before_action :set_user

	def create
		shipping_address = current_user.shipping_addresses.new(shipping_address_params)
		shipping_address.save
		redirect_to user_path(current_user)
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		shipping_address = ShippingAddress.find(params[:id])
		shipping_address.update(shipping_address_params)
		redirect_to user_path(current_user.id)
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def shipping_address_params
		params.require(:shipping_address).permit(:user_id, :postcode, :address)
	end

end
