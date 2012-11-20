class Admin::RecipeCategoriesController < ApplicationController
  load_and_authorize_resource :recipe_category

  def index
    @recipe_category = RecipeCategory.new
  end


  def create
    @recipe_category = RecipeCategory.new(params[:recipe_category])
    if @recipe_category.save
      redirect_to admin_recipe_categories_path, :notice => t("categories.successful.create")
    else
      @recipe_category = RecipeCategory.all
      render :action => :index
    end
  end

  def edit
  end

  def update
    if @recipe_category.update_attributes(params[:recipe_category])
      redirect_to admin_recipe_categories_path, :notice => t("categories.successful.update")
    else
      render :action => :edit
    end
  end

end