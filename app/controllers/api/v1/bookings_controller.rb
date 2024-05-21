class Api::V1::BookingsController < ApplicationController
  before_action :set_room, :set_user, only: [:create, :destroy]
  before_action :set_booking, only: [:destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    # Parse the JSON string to get an array of date strings
    date_strings = JSON.parse(params[:booking_dates])    
    # Get the start and end dates
    start_date = date_strings.min
    end_date = date_strings.max

    if start_date.nil? || end_date.nil?
      render json: { status: 'error', message: 'Invalid booking dates format' }, status: :unprocessable_entity
      return
    end

    if @room.available_on?(start_date, end_date)
      booking = @user.bookings.new(booking_dates: date_strings, room_id: params[:room_id])
      if booking.save
        @room.update_available_dates_after_booking (date_strings)
        render json: { status: 'success', message: 'Room booked successfully', booking: booking}
      else
        render json: { status: 'error', message: 'Failed to book room' }, status: :unprocessable_entity
      end
    else
      render json: { status: 'error', message: 'Room not available for booking' }, status: :unprocessable_entity
    end
  
  end

  def destroy
    @room.update_available_dates_after_cancellation (@booking.booking_dates)
    if @booking.destroy
      render json: { status: 'success', message: 'Booking cancelled successfully' }
    else
      render json: { status: 'error', message: 'Failed to cancel booking' }
    end
  end

  private

  def booking_params
    params.permit(:booking_dates)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def record_not_found
    render json: { status: 'error', message: 'Record not found' }, status: :not_found
  end
  
end
