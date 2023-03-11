class OrdersController < ApplicationController
  def my_orders
    @my_orders = current_user.orders
  end

  def show
  end

  def create
    # current_user.order_products.where(status: true).each do |item|
    #   Order.create({
    #     user_id: item.user_id,
    #     sub_product_id: item.sub_product_id,
    #     quantity: item.quantity,
    #     price: item.sub_product.product.price
    #   })
    # end
  end
end
