Rails.application.routes.draw do
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'coffeebeans#index'

  resources :coffeebeans
end
