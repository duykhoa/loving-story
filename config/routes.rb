Rails.application.routes.draw do
  get 'homes/index'

  resources :service_orders

  root to: 'homes#index'
end
