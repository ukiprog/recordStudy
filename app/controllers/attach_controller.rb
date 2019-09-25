class AttachController < ApplicationController
  def create
    if Attach.create(attachParams)
      redirect_to root_path
    else
    end
  end

  private
  def attachParams
    params.require(:attach).permit(:year, :attach, :user_id)
  end
end
