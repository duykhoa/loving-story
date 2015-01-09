Rails.application.routes.draw do
  devise_for :admin_users
  get 'homes/index'

  resources :service_orders

  root to: 'homes#index'
end
