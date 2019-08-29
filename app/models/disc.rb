class Disc < ApplicationRecord

	belongs_to :album
	belongs_to :artist
	validates :disc_number, presence: true, uniqueness: {scope: :album_id}, numericality: {greater_than: 0}

	has_many :songs, -> {order("song_number")},  dependent: :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true

end
