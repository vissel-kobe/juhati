class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album
  end

  def index
    @albums = Album.all
    @user = current_user
  end

  def show
    # @album = Album.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock)
  end
end
