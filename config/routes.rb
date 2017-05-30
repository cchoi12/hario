Rails.application.routes.draw do
  get 'users/index'
  match '/users',   to: 'users#show',   via: 'get'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only =>[:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'coffeebeans#index'

  resources :coffeebeans
end
