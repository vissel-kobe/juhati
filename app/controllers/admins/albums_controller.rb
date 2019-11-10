class Admins::AlbumsController < ApplicationController

  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def new
    @album = Album.new
    @album.discs.build
    @album.discs.first.songs.build
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to admins_albums_path}
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @albums = Album.page(params[:page]).per(12).reverse_order
    @page_title = "商品一覧"
  end

  def search
    @search = Album.search(params[:search])
  end

  def show
  end

  def edit
  end

  def update
    @album.update(album_params)
    redirect_to admins_album_path(@album.id)
  end

  def destroy
    @album.destroy
    redirect_to admins_albums_path
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :status, :album_image, :price, :label_id, :genre_id, :stock,
                                  discs_attributes: [:id, :disc_number, :artist_id, :_destroy,
                                  songs_attributes: [:id, :song_number, :title, :_destroy]])
  end
end
