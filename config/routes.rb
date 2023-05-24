Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  resources :service_types
  resources :parcels
  resources :addresses
  resources :users
  resources :reports, only: :index do
    get :download_report, on: :collection
  end
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#   require 'resque/server'

#   Rails.application.routes.draw do
#     mount Resque::Server.new, at: "/resque"
#   end
end
