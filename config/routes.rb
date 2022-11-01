Rails.application.routes.draw do
  resources :users
  resource :sessions, only: [ :new, :create, :destroy ]
  root to:'root#home'
end
