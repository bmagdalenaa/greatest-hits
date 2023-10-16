class AlbumsController < ApplicationController

  def index
    @albums = Album.all.order("album_rank ASC")
  end

  def show
    @album = Album.find(params[:id])

    require 'net/http'
    require 'json'
  end
end
