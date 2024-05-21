class Api::V1::RoomsController < ApplicationController
  before_action :set_user

  def index
    @allrooms = Room.all 
    render json: @allrooms, status: :ok
  end

  def create
    available_dates_arr = JSON.parse(params[:available_dates].gsub("'", '"')) # Convert string to array
    available_dates_range = (available_dates_arr.first..available_dates_arr.last).to_a

    room = @user.rooms.new(
        available_dates: available_dates_range
      )
    if room.save!
      render json: { status: 'success', message: 'Room created successfully', room: room}
    else
      render json: { status: 'error', message: 'Failed to create room' }, status: :unprocessable_entity
    end
  end 

  def check_availability
    room = Room.find(params[:id])
    start_date = params[:start_date]
    end_date = params[:end_date]

    return if start_date.blank? || end_date.blank?
    if start_date > end_date
      render json: { status: 'error', message: 'start date must be before the end date' }
    else
      if room.available_on?(start_date, end_date)
        render json: { status: 'available' }
      else
        render json: { status: 'unavailable' }
      end
    end
  end

  private

  def room_params
    params.permit(:available_dates, :start_date, :end_date)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end