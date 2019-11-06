class HomesController < ApplicationController
  def top
    @user = current_user
    @ranking = Album.find(Favorite.group(:album_id).order('count(album_id) desc').limit(3).pluck(:album_id))
  end
end
