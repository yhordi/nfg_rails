Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions, only: [:create, :new, :destroy, :show]
  resources :users, only: [:create, :show]
  resources :posts
  resources :calendars, only: [:index]
end
