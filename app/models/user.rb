
class User < ApplicationRecord
    has_many :bookings
  
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