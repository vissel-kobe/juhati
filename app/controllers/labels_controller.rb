class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def edit
  end

  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to new_album_path
  end

  def update
  end

  def destroy
  end

  def new
    @label = Label.new
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end

end
