class ReadingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @readings = @user.readings
    render :index
  end

  def show
    @reading = Reading.find(params[:reading_id])
    render :show
  end

  def create
    params[:reading][:user_id] = params[:user_id]
    @reading = Reading.create(reading_params)
    render :create
  end

  def update
    @reading = Reading.update(reading_params)
    render :update
  end

  def destroy
    Reading.destroy(params[:reading_id])
  end

  private
  def reading_params
    params.require(:reading).permit(:date, :user_id, :reading_cf)
  end
end
