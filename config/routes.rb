Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: [:show, :edit, :create, :update]

  root 'mystery#index'
end
