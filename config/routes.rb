Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get 'homes/index'

  resources :service_orders

  match '/' => 'service_orders#show', :constraints => { :subdomain => /.+.4ever/ }, via: [:get]
  root to: 'homes#index'
end
