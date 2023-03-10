class OrdersController < ApplicationController
  def my_orders
    @my_orders = current_user.orders
  end

  def show
    @cart = current_user.order_products
  end

  def destroy

  end
end
