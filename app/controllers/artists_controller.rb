class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

end
