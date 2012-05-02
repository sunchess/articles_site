class ArticlesController < ApplicationController
  before_filter :find_category, :only => [ :index, :show ]
  before_filter :find_article, :only => %w{publish delete}
  load_and_authorize_resource :article, :except => "preview"
  protect_from_forgery :except => "preview"

  def my
    @articles = current_user.articles.not_deleted.paginate(:page => params[:page], :per_page => 10)
  end

  def index
    if @category
      @articles = @category.articles.published.paginate(:page => params[:page], :per_page => 10)
      add_breadcrumb @category.name, category_articles_path(@category)
    else
      @articles = Article.published.order("id DESC").paginate(:per_page => 20, :page => params[:page])
    end
  end

  def show
    @article = @category.articles.find(params[:id])
    @articles = @category.articles.where([ "id <> ?", @article.id]).limit(3)
    add_breadcrumb @category.name, category_articles_path(@category)
    add_breadcrumb @article.name, category_article_path(@category, @article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.accessible = [:user_id] if admin?
    if params[:article][:user_id]
      @article.user_id = params[:article][:user_id]
    else
      @article.user = current_user
    end

    if @article.save
      redirect_to my_articles_path, :notice => t( "articles.successful.create" )
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
   #@hotel.accessible = [ :draft, :paid_placement  ] if admin?
   @article.accessible = [:user_id] if admin?
   @article.attributes = params[:article]
   if @article.save
     redirect_to edit_article_path(@article), :notice => t( "articles.successful.update" )
   else
     render :action => :edit
   end
  end

  def publish
    @article.publishing!
    redirect_to :back, :notice => t("articles.successful.update")
  end

  def delete
    @article.delete!
    redirect_to :back, :notice => t("articles.successful.update")
  end

  def destroy
    @article.destroy
    redirect_to category_articles_path(@category)
  end

  def preview
    textile = RedCloth.new(params[:data]).to_html
    render :text => textile
  end

  private
  def find_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
