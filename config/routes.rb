Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin2', as: 'rails_admin'
  resources :organizations
  root 'home#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :documents
  match '/documents/:provider/retrieve' => 'documents#retrieve', via: :get, :as => :retrieve_documents

  resources :identities, only: [:destroy]
  resources :users, only: [:show, :destroy]

  get '/admin', to: redirect('/admin/organizations')
  namespace :admin do
    resources :authentications, only: [:index, :new, :create]
    resources :organizations, only: [:index, :new, :create]
    resources :users, only: [:index]
  end

end
