Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions, only: [:create, :destroy, :show]
  get 'go', to: 'sessions#new'
  resources :users, except: [:index, :new, :destroy]
  resources :posts
  resources :calendars, only: [:index, :create]
  resources :videos, only: [:index, :create]
  # get :mail, to: 'mail#send' 
  resources :mail, only: [:create, :new]
  get 'mail', to: 'mail#new'
end
