Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :destroy] do
    resources :posts
    collection do
      get 'search'
    end
  end
  resources :room_users, only: [:create, :destroy]
end
