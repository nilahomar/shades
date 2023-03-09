class OrderProductsController < ApplicationController
  def show
    @sub_product = SubProduct.find(params[:id])
  end

  def create
    @product = Product.
  end

end
