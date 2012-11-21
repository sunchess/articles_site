class Admin::MainArticlesController < ApplicationController

  def index
    @articles = Article.where(:publish_on_main => true).order('position')
    authorize! :update, @articles
  end

end