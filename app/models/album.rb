class Album < ApplicationRecord


	belongs_to :label
	belongs_to :genre
	has_many :orders
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy

	enum status: { 販売中: 0, 販売停止: 1}
	validates :title, presence: true
	validates :price, presence: true
	validates :stock, presence: true

	has_many :discs, -> {order("disc_number")}, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	attachment :album_image

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def in_cart?(user)
		orders.where(user_id: user.id, status: "cart").exists?
	end

	def self.search(search)
		if search
			Album.where(['title LIKE ?', "%#{search}%"])
		else
			Album.all
		end
	end

end
