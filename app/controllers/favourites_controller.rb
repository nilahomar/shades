class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = current_user.favourites
  end

  def show
    @favourite = Favourite.find(params[:id])
  end

  def create
    unless current_user.favourites.where(sub_product_id: params[:sub_product]).exists?
      @favourite = Favourite.create(
        {
          user_id: current_user.id,
          sub_product_id: params[:sub_product]
        }
      )
      @favourite.save!
    end
    redirect_to sub_product_path(params[:sub_product]), notice: 'Item added to Favourites'
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
