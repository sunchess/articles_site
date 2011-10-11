class HomeController < ApplicationController
  def index
    @articles = Article.published.paginate(:per_page => 20, :page => params[:page])
  end

end
