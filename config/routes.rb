Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get 'homes/index'

  resources :service_orders

  root to: 'homes#index'
end
