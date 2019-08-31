class Album < ApplicationRecord


	belongs_to :label
	belongs_to :genre
	has_many :orders
	has_many :favorites
	has_many :reviews

	enum status: { selling: 1, suspended: 2}
	validates :title, presence: true
	validates :price, presence: true
	validates :stock, presence: true

	has_many :discs, -> {order("disc_number")}, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	attachment :album_image


end
