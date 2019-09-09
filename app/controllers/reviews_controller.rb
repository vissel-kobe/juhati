class ReviewsController < ApplicationController
  
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def ensure_correct_user
    @review = Review.find_by(id: params[:id])
    if current_user.id != @review.user_id
      redirect_to album_path(@review.album_id)
    end
  end

  def edit
    @user = current_user
    @album = Album.find(params[:album_id])
  end

  def create
    @album = Album.find(params[:album_id])
    review = current_user.reviews.new(review_params)
    review.album_id = @album.id
    review.user_id = current_user.id
    review.save
    redirect_to album_path(@album.id)
  end

  def update
    @album = Album.find(params[:album_id])
    @review.update(review_params)
    redirect_to album_path(@album)
  end

  def destroy
    @album = Album.find(params[:album_id])
    @review.destroy
    redirect_to album_path(@album)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :album_id, :body)
  end
end
