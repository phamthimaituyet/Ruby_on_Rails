Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'posts#index'
  get 'posts/index'

  devise_for :users


  resources :users 
  

  resources :posts do 
    resources :comments do
      get :reply
    end 
  end

  resources :comments do
    post '/create', to: 'comments#create'
  end
  resources :groups do
    get ':group_id/posts/new', to: 'posts#new'
    resources :posts
    post "/join_group", to: "groups#join_group"
    post "/accept_join_group", to: "groups#accept_join_group"
  end
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
