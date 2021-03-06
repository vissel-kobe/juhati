class Song < ApplicationRecord

	belongs_to :disc
	validates :title, length: {minimum: 1}
	validates :song_number, presence: true, numericality: {greater_than: 0}

end
