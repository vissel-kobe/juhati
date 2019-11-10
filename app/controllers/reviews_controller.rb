class ReviewsController < ApplicationController

  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def create
    @album = Album.find(params[:album_id])
    @review = Review.new(review_params)
    @review.album_id = @album.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to album_path(@album)
    else
      render 'albums/show'
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to album_path(@album)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to album_path(@album)
  end

  private

  def ensure_correct_user
    @review = Review.find(params[:id])
    @album = Album.find(params[:album_id])
    if @review.user_id != current_user.id
      redirect_to album_path(@album)
    end
  end

  def review_params
    params.require(:review).permit(:user_id, :album_id, :body)
  end
end
