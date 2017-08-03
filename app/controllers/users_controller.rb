class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :username, :role)
  end
end
