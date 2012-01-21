class HomeController < ApplicationController
  def index
    @articles = Article.published.order("updated_at DESC").paginate(:per_page => 20, :page => params[:page])
  end

end
