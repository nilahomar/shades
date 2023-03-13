class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @products = Product.all
    # @color_shades = ColorShade.all
    @favourite = Favourite.all
  end

  def show
    @favourite = Favourite.find(params[:id])
  end

  def create
    @favourite = Favourite.new
    @sub_product = SubProduct.find(params[:subproduct])

    @favourite.user_id = current_user.id
    @favourite.sub_product_id = @sub_product.id
    @favourite.user = current_user
    # @favourite.active = true
    # @favourite.quantity = 1
    @favourite.save!
    redirect_to sub_product_path(@sub_product)
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def favourites_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
