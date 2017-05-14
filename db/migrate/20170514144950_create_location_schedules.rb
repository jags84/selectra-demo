class CreateLocationSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :location_schedules do |t|
      t.string :day
      t.string :open_time
      t.string :close_time
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
