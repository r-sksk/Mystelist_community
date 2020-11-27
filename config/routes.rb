Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]  #いいね機能のルート
  end
  resources :users, only: [:show, :edit, :create, :update]

  root 'mystery#index'
end
