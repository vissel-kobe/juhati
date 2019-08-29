class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def edit
  end

  def create
<<<<<<< HEAD
=======
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to new_album_path
>>>>>>> 2a25276abc2d59aed0de30757b1a82181406839b
  end

  def update
  end

  def destroy
  end

<<<<<<< HEAD
=======
  def new
    @genre = Genre.new
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

>>>>>>> 2a25276abc2d59aed0de30757b1a82181406839b
end
