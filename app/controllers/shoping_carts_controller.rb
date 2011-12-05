class ShopingCartsController < ApplicationController
  def index
  end

  def add 
    store = Store.find(params[:id])
    shop_cart.add(store)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def delete
    store = Store.find(params[:id])
    shop_cart.delete(store)
    redirect_to shoping_carts
  end

  def clear
    shop_cart.clear
    redirect_to :back
  end

end
