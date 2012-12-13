class StoresController < ApplicationController
  before_filter :add_crumb, :only => :show
  after_filter :authorize, :only => [:sort]
  load_and_authorize_resource :store, :except => [:sort]

  def index
    @stores = Store.shown
  end

  def show
    @store = Store.find(params[:id])
    add_breadcrumb @store.name, store_path(@store)
  end

  def sort
    params[:store].each_with_index do |id, index|
      Store.update_all({:position => index+1}, {:id => id})
    end
  render :nothing => true
  
  end

  private
  def add_crumb
    add_breadcrumb "Магазин мёда", stores_path
  end

end
