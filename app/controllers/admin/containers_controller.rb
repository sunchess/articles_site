class Admin::ContainersController < ApplicationController
  load_and_authorize_resource :container

  def index
    @containers = Container.order(:position)
    authorize! :update, @containers
  end

  def new
  end

  def create
    if @container.save
      redirect_to :action => :index, :notice => t("containers.successful.create")
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @container.update_attributes(params[:container])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def delete
  end
end