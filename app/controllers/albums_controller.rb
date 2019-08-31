class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.save
    redirect_to albums_path
  end

  def index
    @albums = Album.all
    @user = current_user
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    pp = params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock)
    pp[:status] = params[:album][:status].to_i
    return pp
  end
end
