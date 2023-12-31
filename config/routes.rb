Rails.application.routes.draw do
  root to: "home#index"

  # search for artists
  resources :artists, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :artists, only: %i[index show]
  resources :albums, only: %i[index show]
  resources :songs, only: %i[index show]
  resources :lyrics, only: %i[index show]
  resources :genres, only: %i[index show]
  resources :about, only: %i[index show]

  # gets the song lyrics
  get 'songs/:id/lyrics', to: 'songs#lyrics', as: 'song_lyrics'
end
