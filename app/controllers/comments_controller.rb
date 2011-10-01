class CommentsController < ApplicationController
  authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @user_who_commented = current_user
    @comment = Comment.build_from( @article, @user_who_commented.id, params[:comment][:body] )
    if @comment.save
       
    else
      render :action => :ajax_errors   
    end
  end

end


