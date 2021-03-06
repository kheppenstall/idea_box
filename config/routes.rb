Rails.application.routes.draw do
  root 'sessions#new'
  
  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :index, :destroy]
    resources :images, only: [:index, :new, :destroy, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end