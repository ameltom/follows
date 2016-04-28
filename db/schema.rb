# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160427221736) do

  create_table "device_data", force: :cascade do |t|
    t.integer  "device_id",     limit: 4,  null: false
    t.integer  "battery_level", limit: 4
    t.integer  "battery_scale", limit: 4
    t.float    "gps_latitude",  limit: 24
    t.float    "gps_longitude", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "device_data", ["device_id"], name: "index_device_data_on_device_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "device_id",  limit: 255, null: false
    t.string   "name",       limit: 255, null: false
    t.string   "code",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "devices", ["code"], name: "index_devices_on_code", unique: true, using: :btree
  add_index "devices", ["device_id"], name: "index_devices_on_device_id", unique: true, using: :btree

  create_table "followers", force: :cascade do |t|
    t.integer  "follower_id", limit: 4, null: false
    t.integer  "follow_id",   limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "followers", ["follow_id"], name: "index_followers_on_follow_id", using: :btree
  add_index "followers", ["follower_id"], name: "index_followers_on_follower_id", using: :btree

end
