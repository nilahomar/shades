class OrderProductsController < ApplicationController
  def show
    @sub_product = SubProduct.find(params[:id])
  end



  def custom_create

      @order_product = OrderProduct.new

      @sub_product = SubProduct.find(params[:subproduct])

      @order_product.user_id = current_user.id

      @order_product.sub_product_id = @sub_product.id

    
      @order_product.save!
      redirect_to sub_product_path(@sub_product)
  end


  private

  def orderproducts_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end
