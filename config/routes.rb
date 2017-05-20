Rails.application.routes.draw do
  match '/users',   to: 'users#index',   via: 'get'
  match '/users',   to: 'users#show',   via: 'get'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'coffeebeans#index'

  resources :coffeebeans
end
