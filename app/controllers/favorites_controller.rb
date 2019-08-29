class FavoritesController < ApplicationController
  def create
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id]) 
  end

  private
  def favorite_params
    params.require(favorite).permit(:user_id, :album_id)
  end
end
