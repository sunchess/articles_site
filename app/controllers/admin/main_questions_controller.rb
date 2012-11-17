class Admin::MainQuestionsController < ApplicationController

  def index
    @questions = Question.where(:publish_on_main => true).all
    authorize! :edit, @question
  end

end