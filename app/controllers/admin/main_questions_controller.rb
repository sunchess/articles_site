class Admin::MainQuestionsController < ApplicationController

  def index
    @questions = Question.where(:publish_on_main => true).order('position')
    authorize! :update, @questions
  end

end