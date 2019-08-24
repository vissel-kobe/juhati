class AlbumsController < ApplicationController
  def new
  end

  def index
    @albums = Album.all
    @user = User.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit()
  end
end
