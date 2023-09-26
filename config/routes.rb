Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  resources :groups, only: [:show, :new, :create] do
    resources :products, only: [:new, :create]    
  end
  
  # Use landing page as root
  # get 'home/index'
  # root 'home#index' 
  
end
