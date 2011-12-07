require 'cart_items'
class ApplicationController < ActionController::Base
  before_filter :add_cart

  protect_from_forgery
  helper_method "admin?"
  helper_method "shop_cart"


  def admin?
    current_user.try(:admin?)
  end

  def shop_cart
    begin
      session[:cart]
    rescue

    end
  end

  private
  def add_cart
    begin
      session[:cart] ||= CartItems.new
    rescue
      session[:cart] = CartItems.new
    end
    #debugger
  end

end
