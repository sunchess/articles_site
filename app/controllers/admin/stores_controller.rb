class Admin::StoresController < ApplicationController
  load_and_authorize_resource :store
  uses_tiny_mce :options => {
                            :theme => 'advanced',
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => false,
                            :theme_advanced_toolbar_location => "top",
                            :theme_advanced_toolbar_align => "left",
                            :theme_advanced_statusbar_location => "bottom",
                            :theme_advanced_buttons1 => %w{ bold italic underline fontselect fontsizeselect formatselect newdocument},
                            :theme_advanced_buttons2 => %w{ justifyleft justifycenter justifyright bullist numlist undo redo }
                            }

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
