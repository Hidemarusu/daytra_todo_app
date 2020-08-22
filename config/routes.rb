Rails.application.routes.draw do
  devise_for :users
  # get '/' => 'home#index'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'comments#index' # ここを追記します
  get 'comments/index' # 自動で設定されたルーティング
end
