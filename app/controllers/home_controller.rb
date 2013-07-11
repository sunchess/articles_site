class HomeController < ApplicationController
  def index
    @articles = Article.published.order(:position)
    @stores = Store.shown.at_index
  end

  def contacts

  end

end
