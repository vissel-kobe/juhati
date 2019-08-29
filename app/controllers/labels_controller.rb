class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def edit
  end

  def create
<<<<<<< HEAD
=======
    @label = Label.new(label_params)
    @label.save
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
    @label = Label.new
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end

>>>>>>> 2a25276abc2d59aed0de30757b1a82181406839b
end
