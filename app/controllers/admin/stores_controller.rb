class Admin::StoresController < ApplicationController
  load_and_authorize_resource :store

  def index
    @stores = Store.order(:position)
    authorize! :update, @stores
  end

  def new
  end

  def create
    if @store.save
      redirect_to :action => :index, :notice => t("stores.successful.create")
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @store.update_attributes(params[:store])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def show
  end

  def delete
  end

end
