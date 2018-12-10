Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  root 'director#new'
  get 'director/new'

  # resources :directors do
  #   resources :movies
  # end
  resources :movies do
    resources :comments
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
