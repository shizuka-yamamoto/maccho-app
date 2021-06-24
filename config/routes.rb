Rails.application.routes.draw do
  devise_for :users
  root to: "targets#index"
  resources :users, only: [:edit, :update, :show]
  resources :targets, only: [:new, :create, :show, :destroy]
end
