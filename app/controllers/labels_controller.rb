class LabelsController < ApplicationController

  def index
    @labels = Label.all
  end

  def albums
  	@label = Label.find(params[:id])
  	@albums = @label.albums.page(params[:page]).per(12).reverse_order
  	@title = "レーベル > " + @label.name + " の商品一覧"
  	render "albums/index"
  end

end
