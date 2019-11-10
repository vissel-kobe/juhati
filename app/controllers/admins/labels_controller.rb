class Admins::LabelsController < ApplicationController
	
  def index
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path
    else
      @title = 'レーベル新規追加'
      @resource = @label
      @submit = '作成'
      render 'template/simple-form'
    end
  end

  def new
    @title = 'レーベル新規追加'
    @resource = Label.new
    @submit = '作成'
    render 'template/simple-form'
  end

  def edit
    @title = 'レーベル編集'
    @resource = Label.find(params[:id])
    @submit = '更新'
    render 'template/simple-form'
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to labels_path
    else
      @title = 'レーベル編集'
      @resource = @label
      @submit = '更新'
      render 'template/simple-form'
    end
  end

  def destroy
  end


  private
  def label_params
    params.require(:label).permit(:name)
  end

end
