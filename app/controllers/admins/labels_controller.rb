class Admins::LabelsController < ApplicationController

  def index
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to admins_labels_path
    else
      @title = 'レーベル新規追加'
      @resource = @label
      @url = admins_labels_path
      @method = :post
      @submit = '作成'
      render 'template/simple-form'
    end
  end

  def new
    @title = 'レーベル新規追加'
    @resource = Label.new
    @url = admins_labels_path
    @method = :post
    @submit = '作成'
    render 'template/simple-form'
  end

  def edit
    @title = 'レーベル編集'
    @resource = Label.find(params[:id])
    @url = admins_label_path(@resource.id)
    @method = :patch
    @submit = '更新'
    render 'template/simple-form'
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to admins_labels_path
    else
      @title = 'レーベル編集'
      @resource = @label
      @url = admins_label_path(@resource.id)
      @method = :patch
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
