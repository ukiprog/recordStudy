class QuestionController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def create

  end
end
