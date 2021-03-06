Rails.application.routes.draw do
  get 'attendances/index'
  get 'users/show'
  get 'event/index'
  root 'event#index'
  get 'home/secret'
  devise_for :users
  resources :users, only: [:show, :new, :create]
  resources :event
  resources :attendances, only: [:new, :index, :edit, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
