Rails.application.routes.draw do
  resources :categories
  resources :reviews
  resources :users
  resources :bottles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
