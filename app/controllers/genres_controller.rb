class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to new_album_path
  end

  def update
  end

  def destroy
   @genre = Genre.find(params[:id])
   @genre.destroy
   redirect_to genres_path
  end

  def new
    @genre = Genre.new
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
