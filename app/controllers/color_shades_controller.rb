class ColorShadesController < ApplicationController
  def index
    @color_shades = ColorShade.all
  end

  def image_upload
    @color_shades = ColorShade.all
  end

  def create
    current_user.pic.attach(params[:this_user][:pic])
    redirect_to my_shades_path
  end
end
