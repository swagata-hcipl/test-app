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

ActiveRecord::Schema.define(version: 20141211061545) do

  create_table "assets", force: true do |t|
    t.string   "location"
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.string   "owner"
    t.string   "status"
    t.string   "model_no"
    t.string   "serial_no"
    t.string   "mac_address"
    t.date     "purchase_date"
    t.string   "purchase_order"
    t.string   "vendor"
    t.decimal  "cost",            precision: 8, scale: 2
    t.string   "amc"
    t.decimal  "amc_amount",      precision: 8, scale: 2
    t.date     "expiry_date"
    t.date     "status_date"
    t.string   "warranty_type"
    t.string   "image_url"
    t.string   "IS_type"
    t.string   "integrity"
    t.string   "confidentiality"
    t.text     "note"
    t.integer  "user_id"
    t.string   "assigned_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.text     "encrypted_password"
    t.string   "employeeid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end