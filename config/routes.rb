Rails.application.routes.draw do
  resources :orders do 
    resources :checkouts
  end
  root 'orders#index'
end
