Rails.application.routes.draw do
  devise_for :users
  # root 'comments#index'
  root to: 'tasks#index'
  # get '/' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'comments/index'
  get 'tasks/index'
  resources :tasks
  # resources :tasks, only: [:show]
  resources :dtasks
end