class Admin::MainArticlesController < ApplicationController

  def index
    @articles = Article.where(:publish_on_main => true).order('position')
    authorize! :update, @articles
  end

end

# params[:article].each_with_index do |id, index|
# Article.update_all({:position => index+1}, {:id => id})
# end

  #def sort
   # params[:article].each_with_index do |id, index|
    #  Article.update_all({:position => index+1}, {:id => id})
    #end
    #render :nothing => true
  #end