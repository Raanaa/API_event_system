class RemoveColumnFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :Users, :string
    remove_column :bookings, :Rooms, :string
    remove_column :bookings, :start_date, :datetime
    remove_column :bookings, :end_date, :datetime
  end
end
