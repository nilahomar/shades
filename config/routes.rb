Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index]
  resources :color_shades, only: [:index] do
    resources :sub_products, only: [:index]
  end
  resources :sub_products, only: [:show]
  get "my_orders", to: "orders#my_orders", as: :my_orders
  get "my_cart", to: "order_products#show", as: :my_cart
  get "pay_products", to: "orders#pay_products", as: :pay_products

end
