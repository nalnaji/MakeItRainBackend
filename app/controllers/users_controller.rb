class UsersController < ApplicationController
  def index
    if params[:by_fbid].present?
     params[:by_fbid] = params[:by_fbid].split(',')
     @users = User.by_fbid(params[:by_fbid])
    else
      @users = User.all
    end
    render :index
  end

  def show
    @user = User.find_by_fb_id(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params)
    render :create
  end

  def update
    params[:id] = User.find_by_fb_id(params[:user][:fb_id])
    @user = User.update(user_params)
    render :update
  end

  def destroy
    params[:id] = User.find_by_fb_id(params[:user][:fb_id])
    User.destroy(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :fb_id, :meter_id)
  end
end
