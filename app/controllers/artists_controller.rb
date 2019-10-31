class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      @title = "アーティスト新規追加"
      @resource = @artist
      @submit = "作成"
      render "template/simple-form"
    end
  end

  def new
    @title = "アーティスト新規追加"
    @resource = Artist.new
    @submit = "作成"
    render "template/simple-form"
  end

  def edit
    @title = "アーティスト編集"
    @resource = Artist.find(params[:id])
    @submit = "更新"
    render "template/simple-form"
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      @title = "アーティスト編集"
      @resource = @artist
      @submit = "更新"
      render "template/simple-form"
    end
  end

  # def destroy
  # end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end