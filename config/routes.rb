Rails.application.routes.draw do
  get 'errors/show'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  namespace :admin do
    resources :service_orders, only: [:index, :edit, :update, :destroy]
    root to: 'service_orders#index'
    resources :pages
  end

  devise_for :admin_users
  get 'homes/index'
  resources :service_orders, only: [:new, :create, :show]

  match '/' => 'service_orders#show', :constraints => { :subdomain => /.+.4ever/ }, via: [:get]
  get '/about-us' => 'admin/pages#show', :id => 'about-us'
  root to: 'homes#index', subdomain: false
end
