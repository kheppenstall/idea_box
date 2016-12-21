Rails.application.routes.draw do
  resources 'users'
  resources 'categories', only: [:new, :create, :index, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end