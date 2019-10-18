class SalesHistory < ApplicationRecord

	belongs_to :shipping_address
	belongs_to :order

	enum status: { ordered: 0, preparing: 1, shipped: 2}
	validates :total, presence: true
end
