Rails.application.routes.draw do
  root to: 'pictures#index'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :favorites, only: [:create, :destroy]
end
