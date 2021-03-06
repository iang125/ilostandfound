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

ActiveRecord::Schema.define(version: 20130827004616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.integer  "find_id"
    t.integer  "owner_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "current",    default: true
    t.string   "ip_address"
  end

  create_table "points", force: true do |t|
    t.integer "user_id"
    t.integer "points"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "cell_show"
    t.string   "cell_number"
    t.boolean  "email_show"
    t.boolean  "home_phone_show"
    t.string   "home_phone"
    t.string   "password_digest"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.text     "qrcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.text     "delivery_options"
    t.text     "qr_code_uid"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ip_address"
    t.integer  "point_tally",      default: 0
  end

end
