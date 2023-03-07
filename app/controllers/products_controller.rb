class ProductsController < ApplicationController
  def index
    if params[:shade]
      @products = Product.where(shade_hex: params[:shade])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
