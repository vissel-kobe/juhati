class ShippingAddress < ApplicationRecord

	belongs_to :user
	has_many :sales_histories

end
