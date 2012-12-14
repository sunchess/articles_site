class Admin::ArticlesController < ApplicationController
  load_and_authorize_resource :article, :except => [:sort]
  after_filter :authorize, :only => [:sort]

  def index
    @articles = Article.order(:position)
  end

  def sort
    params[:article].each_with_index do |id, index|
      Article.update_all({:position => index+1}, {:id => id})
    end
    render :nothing => true
  
  end

end
