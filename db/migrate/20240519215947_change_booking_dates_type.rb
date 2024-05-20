class ChangeBookingDatesType < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :booking_dates, :text
  end
end
