Rails.application.routes.draw do
  root 'record#index'
  resources :record, only: [:index, :create, :update]
  devise_for :users
end
