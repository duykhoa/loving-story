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

  resources :service_orders, only: [:new, :create, :show, :thankyou] do
    get 'thankyou', on: :collection
  end

  get '/', to: 'service_orders#show', constraints: { subdomain: /.+\.4ever/ }

  root to: 'homes#index', subdomain: false
end
