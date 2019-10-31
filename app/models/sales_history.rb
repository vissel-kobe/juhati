class SalesHistory < ApplicationRecord

	belongs_to :shipping_address
	has_many :history_items

	enum status: { ordered: 0, preparing: 1, shipped: 2}
	validates :total, presence: true
end
