class ReadingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @readings = @user.readings
  end

  def show
    @reading = Reading.find(params[:reading_id])
  end

  def create
    @reading = Reading.create(reading_params)
  end

  def update
    @reading = Reading.update(reading_params)
  end

  def destroy
    Reading.destroy(params[:reading_id])
  end

  private
  def reading_params
    params.require(:reading).permit(:date, :user_id, :reading_cf)
  end
end
