Rails.application.routes.draw do
  root 'record#show'
  resources :record, only: [:show, :create, :edit, :update, :destroy]
  resources :comment, only: [:create, :update]
  devise_for :users
end
