Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  get "my_orders", to: "orders#my_orders", as: :my_orders
  get "my_cart", to: "orders#my_cart", as: :my_cart
  get "pay_products", to: "orders#pay_products", as: :pay_products
end
