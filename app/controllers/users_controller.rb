class UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find_by(params[:id])
  end
end
