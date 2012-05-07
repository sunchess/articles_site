class RelativeArticlesController < ApplicationController
  authorize_resource :article
  before_filter :find_article

  def index
    @relative_articles = @article.relatives.published
    @relative_ids = @article.relative_ids
  end

  def create
    @article.relatives = Article.find(params[:relatives])
    redirect_to article_relative_articles_path(@article), :notice => "Похожие статьи добавлены"
  end

  protected
  def find_article
    @article = Article.find(params[:article_id])
    @articles = Article.where("id <> ?", @article.id )
  end

end
