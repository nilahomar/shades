class OrderProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.order_products
  end

  def show
    @order_product = OrderProduct.find(params[:id])
  end

  def custom_create
    op = current_user.order_products.where(sub_product_id: params[:subproduct])
    if op.exists?
      op = op.take
      op.update(
        {
          quantity: op.quantity + 1
        }
      )
    else
      @order_product = OrderProduct.create(
        {
          user_id: current_user.id,
          sub_product_id: params[:subproduct],
          user: current_user,
          quantity: 1
        }
      )
      @order_product.save!
    end
    redirect_to sub_product_path(params[:subproduct])
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to order_products_path, status: :see_other
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(orderproducts_params)
    redirect_to order_products_path(anchor: "order-product-#{@order_product.id}"), status: 303
    # anchor means put at # in the url
  end

  private

  def orderproducts_params
    params.require(:order_product).permit(:quantity)
  end
end
