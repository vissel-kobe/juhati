class Order < ApplicationRecord

	belongs_to :user
	belongs_to :album
	has_many :shipping_addresses

	enum status: { cart: 0, ordered: 1}
	validates :subtotal, presence: true

end
