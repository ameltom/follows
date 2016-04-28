class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_id, null: false
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps null: false
    end

    add_index :devices, :device_id, unique: true
    add_index :devices, :code, unique: true
  end
end
