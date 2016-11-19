Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :documents
  match '/documents/:provider/retrieve' => 'documents#retrieve', via: :get, :as => :retrieve_documents

  resources :identities, only: [:destroy]
  resources :users, only: [:show, :destroy]

end
