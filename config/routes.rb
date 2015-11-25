Rails.application.routes.draw do
  resources :products
  resources :line_items
  resources :orders do 
    resources :checkouts
  end
  root 'orders#index'
end
