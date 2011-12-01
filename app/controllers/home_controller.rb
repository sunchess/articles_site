class HomeController < ApplicationController
  def index
    @articles = Article.published.order("id DESC")
    @stores = Store.shown.at_index
  end

end
