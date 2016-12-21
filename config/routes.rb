Rails.application.routes.draw do
  resources 'users' do
    resources 'ideas', only: [:index, :destroy, :new, :create]
  end

  resources 'categories', only: [:new, :create, :index, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end