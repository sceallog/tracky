class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard; end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated'
    else
      flash[:alert] = 'User could not be updated'
    end
    redirect_to edit_user_registration_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :locale_id, :role_id, :avatar)
  end
end
