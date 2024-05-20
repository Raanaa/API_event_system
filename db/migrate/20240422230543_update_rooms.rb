class UpdateRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_number, :string
  end

end
