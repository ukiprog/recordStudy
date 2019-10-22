class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :user_params, if: :devise_controller?

  def top
    if current_user.position == 'teacher'
      redirect_to :teacher_index
    elsif current_user.position == 'student'
      redirect_to record_path(id: '')
    end
  end

  def user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :position])
  end
end
