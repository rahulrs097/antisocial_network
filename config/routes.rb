Rails.application.routes.draw do
  # User Authentication
  get 'users/log_out' => 'sessions#destroy', as: 'log_out'
  get 'users/log_in' => 'sessions#new', as: 'log_in'
  get 'users/sign_up' => 'users#new', as: 'sign_up'
  root to: 'users#new'
  resources :users
  resources :sessions
  resources :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
