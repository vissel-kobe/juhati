class ReviewsController < ApplicationController

  def edit
    @review = current_user.reviews.find(params[:id])
    @album = Album.find(@review.album_id)
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
    @review = current_user.reviews.find(params[:id])
    @review.update(review_params)
    redirect_to album_path(@album)
  end

  def destroy
    @album = Album.find(params[:album_id])
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to album_path(@album)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :album_id, :body)
  end
end