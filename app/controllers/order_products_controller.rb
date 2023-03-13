class OrderProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.order_products.where(active: true)
  end

  def show
    @order_product = OrderProduct.find(params[:id])
  end

  def custom_create
    @order_product = OrderProduct.new
    @sub_product = SubProduct.find(params[:subproduct])

    @order_product.user_id = current_user.id
    @order_product.sub_product_id = @sub_product.id
    @order_product.user = current_user
    @order_product.active = true
    @order_product.quantity = 1
    @order_product.save!
    redirect_to sub_product_path(@sub_product)
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
