class ShopingCartsController < ApplicationController
  def index
  end

  def add 
    store = Store.find(params[:id])
    shop_cart.add(store, params[:amount].to_f)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def delete
    store = Store.find(params[:id])
    shop_cart.delete(store, params[:amount].to_f, params[:index].to_i)
    redirect_to shoping_carts_path
  end

  def clear
    shop_cart.clear
    redirect_to :back
  end

  def new_mail
    @order = Order.new 
  end

  def send_mail
    @order = Order.new(params[:order])
    if @order.valid?
      @cart = shop_cart
      AppMailer.new_order(@order, @cart).deliver 
      shop_cart.clear
      redirect_to stores_path, :notice => t("order_sent")
    else
      render :action => :new_mail
    end
  end
end
