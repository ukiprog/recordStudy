Rails.application.routes.draw do
  root 'record#index'
  resources :record, only: [:index, :create]
  devise_for :users
end
