class QuestionController < ApplicationController
  def index
    @questions = current_user.questions
    @question = Question.new
    @subjects = Subject.all
  end

  def create
    if Question.create(question_params)
      redirect_to question_index_path
    else
      render :index
    end
  end

  private
  def question_params
    params.require(:question).permit(:user_id, :subject_id, :question)
  end
end
