class LyricsController < ApplicationController
  def index
    @album = Album.all

    require 'net/http'
    require 'json'
  end
end
