class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :Users
      t.string :Rooms

      t.timestamps
    end
  end
end
