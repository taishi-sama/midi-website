Rails.application.routes.draw do
  get 'player/play'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
  get '/register', to: 'register#new'
  post '/register', to: 'register#create'

  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  get '/logout', to: 'login#destroy'

  get '/userfiles', to: 'userfiles#new'
  post '/userfiles', to: 'userfiles#create'
  delete '/userfiles', to: 'userfiles#delete'
  patch '/userfiles/togglepublicity', to: 'userfiles#toggle_publicity'

  get '/play', to: 'player#play'
end
