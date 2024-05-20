class UpdateRoomsdates < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :available_dates, :text, default: [].to_yaml
  end
end
