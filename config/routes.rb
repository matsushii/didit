Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :show, :create, :destroy] do 
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
