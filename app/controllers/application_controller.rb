class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user.try(:locale).locale || I18n.default_locale # = :ja
    I18n.with_locale(locale, &action)
    # I18n.locale = :en # locale
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name locale_id role_id email password])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[name email locale_id role_id avatar password])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :assigned_project)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :email, :locale_id, :role_id)
    end
  end
end
