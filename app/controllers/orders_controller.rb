class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
  end

  def create
    current_user.order_products.each do |item|
      @order = Order.create(
        {
          user_id: item.user_id,
          sub_product_id: item.sub_product_id,
          quantity: item.quantity,
          price: item.sub_product.product.price,
          status: "ORDERED"
        }
      )
      item.destroy if @order.save!
    end
    redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    @order.update(
      status: "CANCELLED"
    )
    redirect_to orders_path, status: :see_other
  end
end
