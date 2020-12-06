Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :destroy] do
    collection do
      get 'search'
    end
    resources :posts do
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :destroy]
    end
  end
  resources :room_users, only: [:create, :destroy]
end
