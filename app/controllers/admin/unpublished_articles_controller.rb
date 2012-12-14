class Admin::UnpublishedArticlesController < ApplicationController

  def index
    @articles = Article.draft
    authorize! :update, @articles
  end

end