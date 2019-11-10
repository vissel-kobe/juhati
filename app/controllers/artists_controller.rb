class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def albums
  	@artist = Artist.find(params[:id])
  	@album_ids = []
  	@artist.discs.each do |d|
  		@album_ids << d.album.id
  	end
  	@albums = Album.where(id: @album_ids).page(params[:page]).per(12).reverse_order
  	@title = "アーティスト > " + @artist.name + " の商品一覧"
  	render "albums/index"
  end

end

