Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#home'
  get 'static_pages/home'

  devise_for :users

  resources :users

  resources :posts do 
    resources :comments
  end
  resources :groups do
    get ':group_id/posts/new', to: 'posts#new'
    resources :posts
  end
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
