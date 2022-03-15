Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/home'
  # get 'pots/index'
  devise_for :users
  resources :users
  resources :posts do 
    resources :comments
  end
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
