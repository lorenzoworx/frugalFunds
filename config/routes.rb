Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  resources :groups, only: [:show, :new, :create]
  resources :products, only: [:new, :create]
  
  # Use landing page as root
  # get 'home/index'
  # root 'home#index' 
  
end
