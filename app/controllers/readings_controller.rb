class ReadingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    query = @user.readings
    query = query.before(params[:before]) if params[:before]
    query = query.after(params[:after]) if params[:after]
    query = query.from_last_day if params[:from_last_day]
    query = query.from_last_week if params[:from_last_week]
    query = query.from_last_month if params[:from_last_month]
    query = query.from_last_6_months if params[:from_last_6_months]
    @readings = query.all
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
