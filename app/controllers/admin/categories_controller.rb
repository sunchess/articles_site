class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource :category

  def index
   # @categories = Category.all
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path, :notice => t("categories.successfule.create")
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, :notice => t("categories.successfule.update")
    else
      render :action => :edit
    end
  end

end
