class Admins::AlbumsController < ApplicationController
	  def new
    @album = Album.new
    @album.discs.build
    @album.discs.first.songs.build
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        @album.update
        format.html { redirect_to albums_path}
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @albums = Album.page(params[:page]).per(12).reverse_order
    @user = current_user
    @title = "商品一覧"
  end

  def search
    @search = Album.search(params[:search])
  end

  def show
    @album = Album.find(params[:id])
    @album_genre = Genre.find(@album.genre_id)
    @album_label = Label.find(@album.label_id)
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

  # def new_album_params
  #   params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock)
  # end
  def album_params
    params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock,
      discs_attributes: [:id, :disc_number, :artist_id, :_destroy,
        songs_attributes: [:id, :song_number, :title, :_destroy]])
  end
end