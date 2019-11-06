class Order < ApplicationRecord

	belongs_to :user
	belongs_to :album

	validates :subtotal, presence: true

end
