Rails.application.routes.draw do
  resources :posts
  root 'mystery#index'
end
