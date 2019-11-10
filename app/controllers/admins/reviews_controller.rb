class Admins::ReviewsController < ApplicationController
  before_action :set_album_and_review, {only: [:edit, :update, :destroy]}

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to admins_album_path(@album)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to admins_album_path(@album)
  end

  private

  def set_album_and_review
    @review = Review.find(params[:id])
    @album = Album.find(params[:album_id])
  end

  def review_params
    params.require(:review).permit(:album_id, :body)
  end
end
