Rails.application.routes.draw do
  root 'application#top'
  resources :record, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :teacher_record, only: [:index, :show]
  resources :comment, only: [:create, :update]
  resources :feedback, only: [:create, :update]
  resources :attach, only: [:create]
  resources :question, only: [:index, :create, :destroy]
  resources :answer, only: [:index, :create, :destroy]
  devise_for :users
end
