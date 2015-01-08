Rails.application.routes.draw do
  get 'homes/index'

  resources :service_orders do

  end

  root to: 'homes#index'
end
