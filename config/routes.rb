Rails.application.routes.draw do
  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # movies/4/rankings/new
  resources :movies do
    resources :rankings, shallow: true
  end
  resources :rankings, only: [:show, :edit, :update, :destroy]

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
