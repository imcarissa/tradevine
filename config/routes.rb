Rails.application.routes.draw do

  root "sessions#home"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/auth/:provider/callback', to: "sessions#omniauth"

  get '/vintage', to: "bottles#vintage"

  
  resources :bottles do
    resources :reviews
  end
  
  resources :reviews
  
  resources :users do
    resources :bottles, shallow: true
  end
  
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
