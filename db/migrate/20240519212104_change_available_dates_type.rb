class ChangeAvailableDatesType < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :available_dates, :text
  end
end
