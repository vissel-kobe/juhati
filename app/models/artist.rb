class Artist < ApplicationRecord

	has_many :discs

	validates :name, presence: true

end
