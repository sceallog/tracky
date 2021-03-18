# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :set_role, only: [:new]
  # before_action :configure_permitted_parameters

  # GET /resource/sign_up
  def new
    super do |_resource|
      @roles = Role.all
      @locales = Locale.all
    end
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super do |_resource|
      @roles = Role.all
      @locales = Locale.all
    end
  end

  # PUT /resource
  def update
    super do |_resource|
      if current_user.save
        I18n.locale = current_user.locale.locale
        flash[:notice] = t('devise.registrations.updated')
      else
        # I18n.locale = current_user.locale.locale
        flash[:alert] = t('devise.errors.messages.not_updated')
      end
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) and return }
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def set_role
    self.role_id = 1 if provider
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :assigned_project)
  #   end
  #   devise_parameter_sanitizer.permit(:account_update) do |user_params|
  #     user_params.permit({ locale_id: [] }, { role_id: [] }, :name, :email, :locale_id, :role_id)
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :email, :locale_id, :role_id, :avatar, :password, :password_confirmation, :current_password)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:locale_id, :role_id, :name, :email, :password, :password_confirmation, :avatar)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
