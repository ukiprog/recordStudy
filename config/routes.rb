Rails.application.routes.draw do
  root 'record#index'
  devise_for :users
end
