Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'pages#home'
  get '/first' => 'pages#first'
  get '/sendtous' => 'pages#sendtous'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :items do
    resources :wishlists, except: :index
    resources :reviews
  end
  resources :wishlists, only: [:index]
end
