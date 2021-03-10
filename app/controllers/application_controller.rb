class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[sign_up, sign_in]
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user.try(:locale) || I18n.default_locale 
    if current_user
      I18n.with_locale(locale.locale, &action)
    else
      I18n.with_locale(locale, &action)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :assigned_project, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :email, :locale_id, :role_id, :password, :password_confirmation, :current_password)
    end
  end
end
