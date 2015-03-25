Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions, only: [:create, :destroy, :show]
  get 'go', to: 'sessions#new'
  resources :users, except: [:index, :new, :destroy]
  resources :posts do
    resources :comments
  end
  resources :calendars, only: [:index, :create]
  resources :videos, only: [:index, :create]
  resources :contacts, only: [:create, :new]
  get 'contact-us', to: 'contacts#new'
end
