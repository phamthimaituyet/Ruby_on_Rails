Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/home'
  # get 'pots/index'
  devise_for :users
  scope '/admin' do 
    resources :users
  end 
  resources :posts do 
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
