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
  resources :wishlists
  resources :items do
    resources :reviews
    resources :coupons
  end
  resources :wishlist_items
  resources :newitems
  resources :ingredients
  resources :combination
end
