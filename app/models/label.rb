class Label < ApplicationRecord

	has_many :albums

	validates :name, presence: true

end
