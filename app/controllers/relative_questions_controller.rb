class RelativeQuestionsController < ApplicationController
  before_filter :find_question

  def index
    @relative_questions = @question.relatives.shown
    @relative_ids = @question.relative_ids
  end

  def create
    @question.relatives = Question.find(params[:relatives])
    redirect_to question_relative_questions_path(@question), :notice => "Похожие вопросы добавлены"
  end

  protected
  def find_question
    authorize! :manage, Question
    @question = Question.find(params[:question_id])
    @questions = Question.shown.where(["id <> ?", @question.id])
  end

end
