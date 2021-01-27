Rails.application.routes.draw do
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :show]
  resources :opinions, only: [:new, :create]
  resources :followings, only: [:create, :destroy]
  get '/followings/:id', to: 'followings#create', as: "follow"
  get '/destroy-followings/:id', to: 'followings#destroy', as: "unfollow"
  root to: "users#index"
end
