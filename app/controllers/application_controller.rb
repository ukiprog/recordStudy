class ApplicationController < ActionController::Base
  before_action :user_params, if: :devise_controller?

  def user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :position])
  end
end
