class FavoritesController < ApplicationController

  before_action :set_album

  def create
    @favorite = current_user.favorites.new(album_id: @album.id)
    @favorite.save
    redirect_to album_path(@album)
  end

  def destroy
    @favorite = current_user.favorites.find_by(album_id: @album.id)
    @favorite.destroy
    redirect_to album_path(@album.id)
  end

  private
  def set_album
    @album = Album.find(params[:album_id])
  end
end
