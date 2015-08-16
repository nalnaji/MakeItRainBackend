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
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params)
    render :create
  end

  def update
    @user = User.update(user_params)
    render :update
  end

  def destroy
    User.destroy(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :fb_id, :meter_id)
  end
end
