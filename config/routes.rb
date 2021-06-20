Rails.application.routes.draw do
  devise_for :users
  root to: "targets#index"
  resources :users, only: [:edit, :update]
  resources :targets, only: [:new, :create]
end
