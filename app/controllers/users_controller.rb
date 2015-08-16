class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.create(user_params)
  end

  def update
    @user = User.update(user_params)
  end

  def destroy
    User.destroy(params[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :fb_id, :meter_id)
  end
end
