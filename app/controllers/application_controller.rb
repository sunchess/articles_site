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
    session[:cart]
  end

  private
  def add_cart
    session[:cart] ||= CartItems.new
    #debugger
  end

end
