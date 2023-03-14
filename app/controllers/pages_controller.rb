class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @color_shades = ColorShade.all
    @products = Product.all
  end
end
