class QuestionsController < InheritedResources::Base
  authorize_resource :question

  def show
    @question = Question.find(params[:id])
    add_breadcrumb @question.name, question_path(@question)
    show!
  end

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
