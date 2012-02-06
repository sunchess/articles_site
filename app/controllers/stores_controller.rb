class StoresController < ApplicationController
  before_filter :add_crumb, :only => :show
  def index
    @stores = Store.shown
  end

  def show
    @store = Store.find(params[:id])
    add_breadcrumb @store.name, store_path(@store)
  end

  private
  def add_crumb
    add_breadcrumb "Магазин мёда", stores_path
  end

end