Rails.application.routes.draw do
  devise_for :users
  # root 'comments#index' 
  root 'tasks#index' 
  # get '/' => 'home#index'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'comments/index' 
  get 'tasks/index'
  resources :tasks
end
