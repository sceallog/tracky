class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role_id assigned_project])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name role_id])
  end
end
