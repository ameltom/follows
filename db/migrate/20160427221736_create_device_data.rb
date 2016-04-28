class CreateDeviceData < ActiveRecord::Migration
  def change
    create_table :device_data do |t|
      t.references :device, null: false
      t.integer :battery_level
      t.integer :battery_scale
      t.float :gps_latitude
      t.float :gps_longitude

      t.timestamps null: false
    end

    add_index :device_data, :device_id
  end
end
