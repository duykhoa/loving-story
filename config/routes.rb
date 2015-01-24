Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  namespace :admin do
    resources :service_orders, only: [:index, :edit, :update, :destroy]
    root to: 'service_orders#index'
  end

  devise_for :admin_users
  get 'homes/index'

  resources :service_orders, only: [:new, :create, :show]

  match '/' => 'service_orders#show', :constraints => { :subdomain => /.+.4ever/ }, via: [:get]
  root to: 'homes#index'
end
