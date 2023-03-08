class ColorShadesController < ApplicationController
  def index
    @color_shades = ColorShade.all
  end
end
