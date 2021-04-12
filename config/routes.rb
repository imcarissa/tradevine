Rails.application.routes.draw do

  root "sessions#home"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :categories
  
  resources :reviews
  
  resources :users do
    resources :posts, only: [:new, :create, :index]
  end
  
  resources :bottles do
  #  resources :reviews, only [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
