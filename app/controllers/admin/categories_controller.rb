class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource :category

  def index
    @category = Category.new
  end


  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path, :notice => t("categories.successful.create")
    else
      @categories = Category.all
      render :action => :index
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, :notice => t("categories.successful.update")
    else
      render :action => :edit
    end
  end

end
