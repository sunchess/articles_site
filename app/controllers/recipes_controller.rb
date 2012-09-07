class RecipesController < InheritedResources::Base
  before_filter :only_admin, :only => [:create, :update]
  load_and_authorize_resource :recipe

  def create
    create!(:notice => "Ваш рецепт добавлен! После проверки администрацией он будет доступен. Спасибо!"){ recipes_path }
    AppMailer.new_recipe(@recipe).deliver
  end

  def update
    update!(:notice => "Рецепт изменен")
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
