Rails.application.routes.draw do
  get 'replies/new'
  get 'likes/new'
  devise_for :users  
  resources :users, only: [:index, :new, :show]
  resources :opinions, only: [:new, :create]
  resources :followings, only: [:create, :destroy] 
  post '/followings/:id', to: 'followings#create', as: "follow"
  post '/destroy-followings/:id', to: 'followings#destroy', as: "unfollow"
  post '/like/:opinion_id/:user_id', to: 'likes#create', as: "like"
  post '/dislike/:opinion_id/:user_id', to: 'dislikes#create', as: "dislike"
  post '/reply-opinion', to: 'replies#create', as: "reply" 
  root to: "users#index"
end
