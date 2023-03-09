class ProductsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "brand_name ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
    @products = Product.all
    end
  end
end
