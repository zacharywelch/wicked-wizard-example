Rails.application.routes.draw do
  resources :orders
  resources :order_steps
  root 'orders#index'
end
