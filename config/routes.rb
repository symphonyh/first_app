Rails.application.routes.draw do
  resources :users
  resources :posts
  resource :sessions, only: [ :new, :create, :destroy ]
  root to:'root#home'
end
