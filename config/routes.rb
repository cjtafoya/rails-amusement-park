Rails.application.routes.draw do
  root to: 'static#index'
  get 'signin', to: 'static#signin'

  resources :users
  get 'logout', to: 'users#logout'

  resources :attractions
  post 'takeride/:id', to: 'attractions#ride', as: 'takeride'

  resources :sessions, only: ['create']

end