class StoresController < ApplicationController
  def index
    @stores = Store.shown
  end

  def show
    @store = Store.find(params[:id])
  end

end
