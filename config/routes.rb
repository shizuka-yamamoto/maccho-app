Rails.application.routes.draw do
  devise_for :users
  root to: "targets#index"
  resources :users, only: [:edit, :update, :show]
  resources :reviews, only: [:new, :create]
  resources :targets, only: [:new, :create, :show, :destroy] do
    collection do
      get 'memo'
    end
    resources :comments, only: :create
  end
end
