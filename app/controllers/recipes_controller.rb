class RecipesController < InheritedResources::Base
  before_filter :only_admin, :only => [:create, :update]
  #before_filter proc{ @comments = if(can? :manage, RecipesComment) then @recipe.recipe_comments else @recipe.recipe_comments.shown end }, :only => :show

  load_and_authorize_resource :recipe

  def create
    create!(:notice => "Ваш рецепт добавлен! После проверки администрацией он будет доступен. Спасибо!"){ recipes_path }
    AppMailer.new_recipe(@recipe).deliver
  end

  def update
    update!(:notice => "Рецепт изменен")
  end

  def show
    @recipes_comments= if(can? :manage, RecipesComment) then @recipe.recipes_comments else @recipe.recipes_comments.shown end
    @recipes_comment = @recipe.recipes_comments.new
    show!
  end


private
  def only_admin
    params[:recipe].delete(:shown) unless( can? :manage, Recipe )
  end

protected
  def collection
    @recipes = if params[:show_all] and can?(:manage, Recipe)
      Recipe.paginate(:page => params[:page])
    else
      Recipe.showned.paginate(:page => params[:page])
    end
  end

end
