Rails.application.routes.draw do
  root to: "tops#index"
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'

  resources :documents
  resources :departments
  resources :projects
  resources :reviews
  resources :products
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :update]
  post '/users/:id', to: 'users#update'
  resources :homes, only: [:index]

  resources :members, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
