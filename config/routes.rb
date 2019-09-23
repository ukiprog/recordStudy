Rails.application.routes.draw do
  root 'record#index'
  resources :record, only: [:index, :create, :edit, :update, :destroy]
  resources :comment, only: [:create, :update]
  devise_for :users
end
