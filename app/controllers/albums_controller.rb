class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @album.discs.build
  end

  def create
    @album = Album.new(album_params)
    @album.save
    redirect_to albums_path
  end

  def index
    @albums = Album.all
    @user = current_user
    @search = Album.search(params[:search])
    @album = Album.where(album_id: params[:album_id])
  end

  def search
    @search = Album.search(params[:search])
  end

  def show
    @album = Album.find(params[:id])
    @album_genre = Genre.find_by(id: @album.genre_id)
    @album_label = Label.find_by(id: @album.label_id)
    @user = current_user
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to album_path(album.id)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    pp = params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock, tags_attributes: [:id, :disc_number, :_destroy])
    pp[:status] = params[:album][:status].to_i
    return pp
  end
end
