class SongsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
  end

  # Retrieves and displays lyrics for a song by a specific artist
  def lyrics
    @artist_name = params[:artist]
    @song_name = params[:song]
    # Calls to another method to fetch the lyrics
    @lyrics = fetch_lyrics(@artist_name, @song_name)

    unless @lyrics
      @error_message = "Lyrics not found for '#{@song_name}' by '#{@artist_name}'."
    end
    render "lyrics/index"
  end

  private

  # Finds the track id for the song by using the specific artist then uses the id to fetch the lyrics.
  def fetch_lyrics(artist, song)
    api_key = 'e762a20ecb2f1811323880ace3135a7a'
    base_url = 'https://api.musixmatch.com/ws/1.1/'
    track_id = search_track(artist, song, api_key, base_url)
    return nil unless track_id
    get_lyrics(track_id, api_key, base_url)
  end

  # Finds the track id for a song by the specific artist.
  def search_track(artist, song, api_key, base_url)
    search_url = "#{base_url}track.search?q_artist=#{artist}&q_track=#{song}&apikey=#{api_key}"
    response = Net::HTTP.get(URI(search_url))
    search_results = JSON.parse(response)
    track_info = search_results['message']['body']['track_list'].find { |track| track['track']['has_lyrics'] == 1 }
    track_info&.dig('track', 'track_id')
  end

  # fetches the lyrics for a song based on the track id
  def get_lyrics(track_id, api_key, base_url)
    lyrics_url = "#{base_url}track.lyrics.get?track_id=#{track_id}&apikey=#{api_key}"
    response = Net::HTTP.get(URI(lyrics_url))
    lyrics_info = JSON.parse(response)
    lyrics_info.dig('message', 'body', 'lyrics', 'lyrics_body')
  end
end