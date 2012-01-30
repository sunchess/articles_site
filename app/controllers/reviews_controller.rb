class ReviewsController < InheritedResources::Base
  load_and_authorize_resource :review
  actions :index, :destroy, :new, :create, :publish, :edit, :update
  custom_actions :resource => :publish

  def create
    create!(:notice => "Отзыв добавлен. Спасибо!") { reviews_path }
  end

  def publish
    @review = Review.find(params[:id])
    authorize! :update, @review
    @review.update_attribute(:shown, true)
    redirect_to :reviews, :notice => "Отзыв опубликован"
  end

  protected
    def collection
      @reviews ||= Review.order("id DESC").paginate(:page => params[:page])
    end
end
