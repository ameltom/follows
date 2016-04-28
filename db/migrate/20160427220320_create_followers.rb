class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :follower, null: false
      t.references :follow, null: false

      t.timestamps null: false
    end

    add_index :followers, :follower_id
    add_index :followers, :follow_id
  end
end
