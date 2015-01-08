Rails.application.routes.draw do
  namespace :admin do
    resources :service_orders, only: [:index, :edit, :update, :destroy]
    root to: 'service_orders#index'
  end

  devise_for :admin_user
  get 'homes/index'

  resources :service_orders

  root to: 'homes#index'
end
