Rails.application.routes.draw do
  root to: 'static#index'
  get 'signin', to: 'static#signin'

  resources :users
  resources :attractions, only: ['index', 'show']
  resources :sessions, only: ['create']

end