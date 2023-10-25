class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("artist_name ASC")
    @albums = Album.all
  end

  def show
    @artist = Artist.find(params[:id])
    @album = Album.all.where("artist_id" == @artist)
    @artists = Artist.paginate(page: params[:page], per_page: 10)
  end

  def search
    @wildcard_search = "%#{params[:keywords]}%"
    @selection = params[:selection]
    @artists = Artist.where("artist_name LIKE ?", @wildcard_search)
    @albums = Album.where("album_name LIKE ?", @wildcard_search)
  end
end
