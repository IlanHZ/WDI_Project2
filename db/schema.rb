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

ActiveRecord::Schema.define(version: 20160224135706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string  "message_content"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.text    "title"
    t.string  "contact"
    t.string  "contact_input"
  end

  create_table "properties", force: :cascade do |t|
    t.string  "address1"
    t.string  "owner"
    t.string  "picures"
    t.string  "property_type"
    t.string  "number_of_rooms"
    t.string  "price"
    t.string  "comment"
    t.integer "user_id"
    t.string  "profile_pic"
    t.string  "city"
    t.string  "postcode"
    t.float   "lat"
    t.float   "lng"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "gender"
    t.string "age"
    t.string "image"
    t.string "password_digest"
    t.string "comment"
    t.string "profile_pic"
  end

end
