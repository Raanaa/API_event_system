class Room < ApplicationRecord
  serialize :available_dates, Array
  has_many :bookings

  def available_on?(start_date, end_date)
      # Parse input dates
      start_date = Date.parse(start_date)
      end_date = Date.parse(end_date)

      # convert from strings to Date objects
      available_dates_objects = available_dates.map { |date| Date.parse(date) }         
      booking_range = (start_date..end_date).to_a
      booking_range.all? { |date| available_dates_objects.include?(date) }

  end

  def update_available_dates_after_booking(booking_dates)
    self.available_dates -= booking_dates.map(&:to_s)
    self.save!
  end

  def update_available_dates_after_cancellation(booking_dates)
    self.available_dates += booking_dates
    self.available_dates.sort!
    self.save!
  end

end
