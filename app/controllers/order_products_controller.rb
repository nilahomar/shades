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
    redirect_to request.referrer, notice: 'Item added to cart'
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to order_products_path, status: :see_other
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(orderproducts_params)
    redirect_to order_products_path, status: 303
    # anchor means put at # in the url (anchor: "order-product-#{@order_product.id}")
  end

  def payment
    @cart = current_user.order_products
    @sub_total = (@cart.map { |item| item.sub_product.product.price * item.quantity }).sum
    @vat = 20
    @vat_amount = @sub_total * @vat / 100
    @total = @sub_total + @vat_amount
  end

  private

  def orderproducts_params
    params.require(:order_product).permit(:quantity)
  end
end
