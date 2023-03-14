class ApplicationController < ActionController::Base

  before_action :show_items, :set_color_shades
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def show_items
    @order_products_items = OrderProduct.all.length
  end

  def set_color_shades
    @color_shades = ColorShade.all
  end
end
