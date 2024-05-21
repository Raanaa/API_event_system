class User < ApplicationRecord
  has_secure_password
  has_many :bookings, dependent: :destroy
  has_many :rooms, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Generate token for user
  def generate_token
    JWT.encode({ user_id: id }, Rails.application.secrets.secret_key_base)
  end

  # Validate token and return corresponding user
  # decodes the token and finds the corresponding user.
  def self.from_token(token)
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    user_id = decoded_token['user_id']
    find_by(id: user_id)
  rescue JWT::DecodeError
    nil
  end

  def reservations_data
    reservations = bookings.map do |booking|
      {
        room_number: booking.room.room_number, # Assuming there's a room_number attribute in the Room model
        start_date: booking.booking_dates.first,
        end_date: booking.booking_dates.last,
        nights_count: (booking.booking_dates.last - booking.booking_dates.first).to_i + 1
      }
    end

    {
      username: username,
      reservation_details: reservations
    }
  end
end