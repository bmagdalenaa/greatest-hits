class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("artist_name ASC")
    @albums = Album.all
  end

  def show
    @artist = Artist.find(params[:id])
    @album = Album.all.where("artist_id" == @artist)
  end
end
