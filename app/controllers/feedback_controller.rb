class FeedbackController < ApplicationController
  def create
    if current_user.feedbacks.create(feedbackParams)
      redirect_to request.referer
    else
    end
  end

  def update
    feedback = Feedback.find(params[:id])
    if feedback.update(feedbackParams)
      redirect_to request.referer
    else
    end
  end

  private
  def feedbackParams
    params.require(:feedback).permit(:feedback_at, :feedback, :student_id)
  end
end
