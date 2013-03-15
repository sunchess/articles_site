class RecipeCategoriesController < ApplicationController
  def index
  end

  def show
    @category = RecipeCategory.find(params[:id])
  end
end
