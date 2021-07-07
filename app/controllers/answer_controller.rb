class AnswerController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
    @subjects = Subject.all
  end

  def create
    if Question.create(question_params)
      redirect_to question_index_path
    else
      render :index
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
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
