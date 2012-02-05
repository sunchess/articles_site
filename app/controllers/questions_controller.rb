class QuestionsController < InheritedResources::Base
  authorize_resource :question

  def create
    create!
    AppMailer._question(@question).deliver
  end

  def hidden
    @questions = Question.hidden
    authorize! :manage, Question
    render :action => :index
  end

  protected
  def collection
    @questions = Question.shown
  end

end
