
class Api::V1::UsersController < Api::V1::ApplicationController
  def bookings
    user = User.find(params[:id])
    reservations_data = user.reservations_data
  end
end