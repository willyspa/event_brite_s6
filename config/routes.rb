Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'home/secret'
  devise_for :users
  resources :users, only: [:show, :new, :create]
  resources :event
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
