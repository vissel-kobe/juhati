class ReviewsController < ApplicationController
  def edit
    @find_review = current_user.reviews.find(params[:id])
  end
  
  def create
    @album = Album.find(params[:album_id])
    review = current_user.reviews.new(review_params)
    review.album_id = @album.id
    review.save
    redirect_to album_path(@album)
  end

  def update
    @album = Album.find(params[:album_id])
    @find_review = current_user.reviews.find_by(id: params[:id])
    @find_review.update(review_params)
    redirect_to album_path(@album)
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :album_id, :body)
  end
end
