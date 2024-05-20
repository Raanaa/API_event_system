class Booking < ApplicationRecord
  serialize :booking_dates, Array
  belongs_to :room
  belongs_to :user
  validates_presence_of :booking_dates

end
