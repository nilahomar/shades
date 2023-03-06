class OrdersController < ApplicationController
  def my_orders
    @my_orders = current_user.orders
  end
end
