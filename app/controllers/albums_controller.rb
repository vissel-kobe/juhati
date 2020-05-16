class AlbumsController < ApplicationController

  def index
    @albums = Album.page(params[:page]).per(12).reverse_order
    @page_title = "商品一覧"
  end

  def search
    @search = Album.search(params[:search])
  end

  def show
    @album = Album.find(params[:id])
  end

end
