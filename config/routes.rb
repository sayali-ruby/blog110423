Rails.application.routes.draw do
  devise_for :users

  resources :profiles
  resources :posts

  root to: "home#index"
end
