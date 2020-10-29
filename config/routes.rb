Rails.application.routes.draw do
  get 'partners/new'
  get 'partners/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/auth/:provider/callback', to: 'sessions#create'

  root to: 'pages#home'
  get '/docs', to: 'pages#docs'
  get '/first' => 'pages#first'
  get '/sendtous' => 'pages#sendtous'
  get '/responsible' => 'pages#responsible'
  get '/responsibleingredient' => 'pages#responsibleingredient'
  get '/thanks' => 'produtos#thanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :items do
    resources :wishlists, except: :index
    resources :reviews
    resources :coupons
    end
  resources :wishlists, only: [:index]
  resources :requested_items
  resources :produtos
  resources :ingredients
  resources :combination
  resources :merger
  resources :partners, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'create_tracker', to: 'coupon_leads#create_coupon'
    end
   end

end
