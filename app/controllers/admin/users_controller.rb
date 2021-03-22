class Admin::UsersController < ApplicationController
  before_action :find_user, except: %i[index]

  def index
    @users = User.order('id ASC').paginate(page: params[:page], per_page: 30)
  end

  def show; end

  def update
    if @user.update(user_update_params)
      I18n.locale = current_user.locale.locale
      flash[:notice] = t('strings.resources.updated', resource: Role.model_name.human)
    else
      # I18n.locale = current_user.locale.locale
      flash[:alert] = t('errors.messages.not_updated', resource: Role.model_name.human)
    end
    redirect_to admin_users_path
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit(:role_id)
  end
end
