class Admin::MainArticlesController < ApplicationController

  def index
    @articles = Article.where(:publish_on_main => true).all
    authorize! :edit, @articles
  end

end
