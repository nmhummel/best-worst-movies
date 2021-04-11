Rails.application.routes.draw do
  root 'welcome#home'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
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
