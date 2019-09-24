class CommentController < ApplicationController
  def create
    if current_user.comments.create(commentParams)
      redirect_to root_path
    else
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(commentParams)
      redirect_to root_path
    else
    end
  end

  private
  def commentParams
    params.require(:comment).permit(:comment_at, :comment)
  end
end
