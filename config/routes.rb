Rails.application.routes.draw do
  root 'record#index'
  resources :record, only: [:index, :create, :edit, :update, :destroy]
  devise_for :users
end
