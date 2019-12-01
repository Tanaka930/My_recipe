Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'} 
  
  devise_scope :user do
    get "user/:id", to: "users#show"
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

  root 'recipes#index'
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end

  resources :users
end
