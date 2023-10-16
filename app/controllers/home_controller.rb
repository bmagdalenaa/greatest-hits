class HomeController < ApplicationController
  def index
    @albuns = Album.includes(:artist).order("album_rank ASC").limit(10)

    @artists = Artist.limit(10)
  end
end
