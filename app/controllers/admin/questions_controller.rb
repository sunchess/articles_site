class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource :question, :except => [:sort]
  after_filter :authorize, :only => [:sort]

  def index
    @questions = Question.order(:position)
    authorize! :update, @questions
  end

  def sort
    params[:question].each_with_index do |id, index|
      Question.update_all({:position => index+1}, {:id => id})
    end
    render :nothing => true
  
  end

end
