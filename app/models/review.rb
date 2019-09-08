class Review < ApplicationRecord

	belongs_to :user
	belongs_to :album

	validates :body, length: {minimum: 1}

end
