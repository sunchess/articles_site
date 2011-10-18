class SearchController < ApplicationController

  def index
    @articles = Array.new
    if params[:search]
      @articles = Article.search params[:search]
    end
  end

end
