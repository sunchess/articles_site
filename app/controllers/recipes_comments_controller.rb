class RecipesCommentsController < ApplicationController
  authorize_resource :recipes_comment

  before_filter :find_recipe
  before_filter :find_recipes_comment, :only => [:edit, :update, :destroy, :publish]

  def create
    @recipes_comment = @recipe.recipes_comments.build(params[:recipes_comment])
    if @recipes_comment.save
      redirect_to @recipe, :notice => "Ваш комментарий отправлен на модерацию"
    else
      render :file => "recipes/show"
    end
  end

  def edit
  end

  def update
    if @recipes_comment.update_attributes(params[:recipes_comment])
      redirect_to edit_recipe_recipes_comment_path(@recipe, @recipes_comment), :notice => "Комментарий изменен"
    else
      render :action => :edit
    end
  end

  def destroy
    @recipes_comment.destroy
    redirect_to @recipe, :notice => "Комментарий удален"
  end

  def publish
    authorize! :edit, @recipes_comment
    @recipes_comment.shown = true
    if @recipes_comment.save!
      redirect_to @recipe, :notice => "Комментарий опубликован"
    else
      flash[:alert] = "Не получилось опубликовать комментарий"
      redirect_to edit_recipe_recipes_comment_path(@recipe, @recipes_comment)
    end

  end

  private
  def find_recipe
    @recipe = Recipe.showned.find(params[:recipe_id])
  end

  def find_recipes_comment
    @recipes_comment = RecipesComment.find(params[:id])
  end

end
