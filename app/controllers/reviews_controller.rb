class ReviewsController < ApplicationController
  def edit
  end
  
  def create
    album = Album.find(params[:album_id])
    review = current_user.reviews.new(review_params)
    review.album_id = album.id
    review.save
  end

  def update
  end

  def destroy
  end

end
