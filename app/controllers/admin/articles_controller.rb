class Admin::ArticlesController < ApplicationController
  load_and_authorize_resource :article

  def index
    @articles = Article.draft 
  end

end
