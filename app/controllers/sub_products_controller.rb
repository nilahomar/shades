class SubProductsController < ApplicationController
  def index
    @sub_products = SubProduct.where(color_shade_id: params[:color_shade_id])
  end

  def show
    @sub_product = SubProduct.find(params[:id])
    @product = @sub_product.product
  end
end
