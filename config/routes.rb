Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :room_users, only: [:create, :destroy]
end
