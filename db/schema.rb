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

ActiveRecord::Schema.define(version: 20141120212221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.float    "price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.string   "picture"
  end

  add_index "listings", ["type_id"], name: "index_listings_on_type_id", using: :btree
  add_index "listings", ["user_id", "created_at", "price", "type_id"], name: "index_listings_on_user_id_and_created_at_and_price_and_type_id", using: :btree
  add_index "listings", ["user_id", "created_at", "price"], name: "index_listings_on_user_id_and_created_at_and_price", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "solds", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.float    "price"
    t.integer  "user_id"
    t.integer  "type_id"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solds", ["type_id"], name: "index_solds_on_type_id", using: :btree
  add_index "solds", ["user_id"], name: "index_solds_on_user_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fName"
    t.string   "lName"
    t.string   "email"
    t.integer  "sID"
    t.string   "classYr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
