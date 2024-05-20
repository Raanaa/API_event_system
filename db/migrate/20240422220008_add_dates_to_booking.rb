class AddDatesToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_date, :datetime
  end
end