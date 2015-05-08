Rails.application.routes.draw do
  root to: 'application#index'

  get 'games/search' => 'games#search'
  resources :games, only: [:index, :show, :search, :destroy]
  resources :users, only: [:index, :new, :create]

  # post 'searches' => 'searches#create'

    # log in form
  get 'sessions/new' => 'sessions#new'
  # actually logging in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#destroy'
end
