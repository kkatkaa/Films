Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  root 'welcome#index'
  get 'welcome/index'

  resources :movies do
    resources :comments
  end
  resources :genres

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
