class StoresController < ApplicationController
  before_filter :add_breadcrumb
  def index
    @stores = Store.shown
  end

  def show
    @store = Store.find(params[:id])
    add_breadcrumb @store.name, store_path(@store)
  end

  private
  def add_breadcrumb
    add_breadcrumb "Магазин", stores_path
  end

end
