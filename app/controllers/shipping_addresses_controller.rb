class ShippingAddressesController < ApplicationController

	before_action :set_user

	def new
		@shipping_address = current_user.shipping_addresses.new
	end

	def index
		@shipping_addresses = @user.shipping_addresses
	end

	def create
		shipping_address = current_user.shipping_addresses.new(shipping_address_params)
		shipping_address.save
		redirect_to user_shipping_addresses_path(user_id: current_user.id)
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		shipping_address = ShippingAddress.find(params[:id])
		shipping_address.update(shipping_address_params)
		redirect_to user_shipping_addresses_path(user_id: current_user.id)
	end

	private
	def set_user
		@user = User.find(params[:user_id])
	end

	def shipping_address_params
		params.require(:shipping_address).permit(:user_id, :postcode, :address)
	end

end
