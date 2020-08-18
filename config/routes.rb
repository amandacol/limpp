Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'pages#home'
  get '/first' => 'pages#first'
  get '/sendtous' => 'pages#sendtous'
  get '/responsible' => 'pages#responsible'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :items do
    resources :wishlists, except: :index
    resources :reviews
    resources :coupons
    end
  resources :wishlists, only: [:index]
  resources :requested_items
  resources :ingredients
  resources :combination
  resources :merger
end
