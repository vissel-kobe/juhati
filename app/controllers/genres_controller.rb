class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      @title = "ジャンル新規追加"
      @resource = @genre
      @submit = "作成"
      render "template/simple-form"
    end
  end

  def new
    @title = "ジャンル新規追加"
    @resource = Genre.new
    @submit = "作成"
    render "template/simple-form"
  end

  def edit
    @title = 'ジャンル編集'
    @resource = Genre.find(params[:id])
    @submit = '更新'
    render 'template/simple-form'
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      @title = 'ジャンル編集'
      @resource = @genre
      @submit = '更新'
      render 'template/simple-form'
    end
  end

  # できれば物理削除したくないのでコメントアウト
  # def destroy
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  #   redirect_to genres_path
  # end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
