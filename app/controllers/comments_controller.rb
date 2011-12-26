class CommentsController < ApplicationController
  authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @user_who_commented = current_user.id
    if admin? and params[:comment][:user_id]
      @user_who_commented = params[:comment][:user_id].to_i
    end
    @comment = Comment.build_from( @article, @user_who_commented, params[:comment][:body] )
    @parent = Comment.find(params[:parent]) if params[:parent] and params[:parent].to_i != 0
    if @comment.save
       @comment.move_to_child_of(@parent) if @parent
    else
      render :action => :ajax_errors   
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
    else
      render :action => :ajax_errors   
    end
  end

end


