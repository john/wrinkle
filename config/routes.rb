Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :documents
  resources :identities, only: [:destroy]
  resources :users, only: [:show, :destroy]

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  match '/quip/get_threads' => 'quip#get_threads', via: :get

end
