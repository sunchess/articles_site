class ArticlesController < ApplicationController
  before_filter :find_category, :only => [ :index, :show ]
  load_and_authorize_resource :article, :except => "preview"
  protect_from_forgery :except => "preview"

  def my
    @articles = current_user.articles.paginate(:page => params[:page], :per_page => 10)
  end
   
  def index
    @articles = @category.articles.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @articles = @category.articles.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user
    if @article.save
      redirect_to my_articles_path 
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
   #@hotel.accessible = [ :draft, :paid_placement  ] if admin?
   #@hotel.attributes = params[:hotel] 
  end

  def publish
    
  end

  def delete
    
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
    @category = Category.find(params[:category_id])
  end

end
