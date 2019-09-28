class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save!
    redirect_to new_album_path
  end

  def update
  end

  def destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end
