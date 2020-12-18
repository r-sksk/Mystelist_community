Rails.application.routes.draw do
  devise_for :users, controllers: {  #deviseのコントローラーを編集・変更
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do #deviseのコントローラーに追記
    post '/users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストユーザーログイン機能のルート
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]  #いいね機能のルート
    resources :comments, only: [:create, :destroy]  #コメント機能のルート
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'favorites' => 'users#favorites'
    get 'histories' => 'users#histories'
    get 'comments' => 'users#comments'
  end

  resources :notifications, only: [:index] #通知機能のルート

  root 'mystery#index'
end
