class QuestionsController < InheritedResources::Base
  after_filter :authorize, :only => [:sort]
  load_and_authorize_resource :question, :except => [:sort]

  def index
    @questions = Question.order(:position)
  end

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
  
  def publish_on_main
    @question = Question.find(params[:id])
    @question.update_attribute(:publish_on_main, true)
    redirect_to :back, :notice => t("questions.successful.published_on_main")
  end

  def not_publish_on_main
    @question = Question.find(params[:id])
    @question.update_attribute(:publish_on_main, false)
    redirect_to :back, :notice => t("questions.successful.not_published_on_main")
  end

  def sort
    params[:question].each_with_index do |id, index|
      Question.update_all({:position => index+1}, {:id => id})
    end
  render :nothing => true
  
  end

  protected
  def collection
    @questions = Question.shown
  end

end