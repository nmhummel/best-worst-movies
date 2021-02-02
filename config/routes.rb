Rails.application.routes.draw do
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/' => 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/signup' => 'users#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :movies do
    resources :rankings, shallow: true
  end

  resources :rankings, only: [:show, :edit, :update, :destroy]

  resources :users

  get '*path', to: redirect('/'), constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  } 

end
