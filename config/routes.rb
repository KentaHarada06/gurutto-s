Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:create, :destroy] do
    collection do
      get 'search'
    end
    resources :posts do
      collection do
        get 'search'
        get 'favorite'
      end
      resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end
  resources :room_users, only: [:create, :destroy]
end
