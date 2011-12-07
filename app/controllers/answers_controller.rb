class AnswersController < InheritedResources::Base
  before_filter :find_question
  #belongs_to :question
  def create
    @answer = Answer.new(params[:answer])
    @answer.question = @question
    create!(:notice => t("answers.success.create")) { hidden_questions_path }
  end

  private
  def find_question
    @question = Question.find(params[:question_id])
  end
end
