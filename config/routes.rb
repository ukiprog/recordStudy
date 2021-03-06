Rails.application.routes.draw do
  root 'record#show'
  resources :record, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :comment, only: [:create, :update]
  resources :attach, only: [:create]
  resources :question, only: [:index, :create, :destroy]
  devise_for :users
end
