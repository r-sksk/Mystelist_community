Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resource :favorites, only: [:create, :destroy]  #いいね機能のルート
    resources :comments, only: [:create, :destroy]  #コメント機能のルート
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'favorites' => 'users#favorites'
    get 'histories' => 'users#histories'
  end

  root 'mystery#index'
end
