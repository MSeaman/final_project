Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root to: 'application#index'

  get 'games/search' => 'games#search'
  get 'games/one' => 'games#one'
  resources :games
  resources :users

  # post 'searches' => 'searches#create'

    # log in form
  get 'sessions/new' => 'sessions#new'
  # actually logging in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#destroy'
end
