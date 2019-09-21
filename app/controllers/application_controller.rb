class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sign_up_params, if: :devise_controller?

  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :position])
  end
end
