Rails.application.routes.draw do

  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  #match '/auth/failure' => 'sessions#failure' 
  
  get '/signup' => 'users#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # movies/4/rankings/new
  resources :movies do
    resources :rankings, shallow: true
  end
  resources :rankings, only: [:show, :edit, :update, :destroy]

  resources :users

end
