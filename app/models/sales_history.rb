class SalesHistory < ApplicationRecord

	belongs_to :user
	belongs_to :shipping_address
	has_many :history_items

	enum status: { '購入済み': 0, '発送準備中': 1, '発送済み': 2}
	validates :total, presence: true
end
