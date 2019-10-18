class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_album_path
    else
      render 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render 'edit'
    end
  end

  # def destroy
  # end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end