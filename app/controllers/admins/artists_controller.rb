class Admins::ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to admins_artists_path
    else
      @title = "アーティスト新規追加"
      @resource = @artist
      @url = admins_artists_path
      @method = :post
      @submit = "作成"
      render "template/simple-form"
    end
  end

  def new
    @title = "アーティスト新規追加"
    @resource = Artist.new
    @url = admins_artists_path
    @method = :post
    @submit = "作成"
    render "template/simple-form"
  end

  def edit
    @title = "アーティスト編集"
    @resource = Artist.find(params[:id])
    @url = admins_artist_path(@resource.id)
    @method = :patch
    @submit = "更新"
    render "template/simple-form"
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admins_artists_path
    else
      @title = "アーティスト編集"
      @resource = @artist
      @url = admins_artist_path(@resource.id)
      @method = :patch
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
