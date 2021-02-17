Rails.application.routes.draw do
  get 'likes/new'
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :show]
  resources :opinions, only: [:new, :create]
  resources :followings, only: [:create, :destroy]
  # resources :likes, only: :create
  get '/followings/:id', to: 'followings#create', as: "follow"
  get '/destroy-followings/:id', to: 'followings#destroy', as: "unfollow"
  post '/like/:opinion_id/:user_id', to: 'likes#create', as: "like"
  post '/dislike/:opinion_id/:user_id', to: 'dislikes#create', as: "dislike"
  root to: "users#index"
end
