Rails.application.routes.draw do
  resources :users do
    get 'followers', on: :member
    get 'followings', on: :member
    post 'follow', on: :member
    delete 'unfollow', on: :member
  end
  resources :posts
  resource :sessions, only: [ :new, :create, :destroy ]
  root to:'root#home'
end
