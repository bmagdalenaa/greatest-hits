Rails.application.routes.draw do
  root to: "home#index"

  resources :artists, only: %i[index show]
  resources :albums, only: %i[index show]
  resources :songs, only: %i[index show]
  resources :lyrics, only: %i[index show]
  resources :genres, only: %i[index show]
  resources :about, only: %i[index show]
end
