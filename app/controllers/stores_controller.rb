class StoresController < ApplicationController
  def index
    @stores = Store.shown
  end

  def show
    @store = Store.find(params[:id])
    add_breadcrumb @store.name, store_path(@store)
  end

end
