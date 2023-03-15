Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index]
  resources :color_shades, only: [:index, :create] do
    resources :sub_products, only: [:index]
  end
  resources :sub_products, only: [:show]
  resources "order_products", only: [:index, :destroy, :update]
  resources "orders", only: [:index, :create, :update]
  resources "favourites", only: [:index, :create, :destroy]

  get "my_shades", to: "color_shades#image_upload", as: :my_shades
  # get "my_orders", to: "orders#my_orders", as: :my_orders
  post "order_products", to: "order_products#custom_create", as: :order_product_custom_create
  # get "my_cart", to: "orders#show", as: :my_cart

  get "pay_products", to: "orders#pay_products", as: :pay_products
end
