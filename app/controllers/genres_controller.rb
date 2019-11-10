class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def albums
  	@genre = Genre.find(params[:id])
  	@albums = @genre.albums.page(params[:page]).per(12).reverse_order
  	@title = "ジャンル > " + @genre.name + " の商品一覧"
  	render "albums/index"
  end

end
