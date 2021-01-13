class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user.try(:locale).locale || I18n.default_locale # = :ja
    I18n.with_locale(locale, &action)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role_id assigned_project locale_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name role_id locale_id])
  end
end
