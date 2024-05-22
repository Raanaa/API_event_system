
class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def reservations
    user = User.find(params[:id])
    reservations = user.reservations_data
    render json:{
      reservation_details: reservations
    }
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end