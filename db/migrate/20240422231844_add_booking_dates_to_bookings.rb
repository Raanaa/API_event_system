class AddBookingDatesToBookings < ActiveRecord::Migration[7.0]
  def change
    # add_column :bookings, :booking_dates, :text
    # add_column :bookings, :booking_dates, :text, array: true, default: []
    add_column :bookings, :booking_dates, :text, default: [].to_yaml
  end
end
