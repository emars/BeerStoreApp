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

ActiveRecord::Schema.define(version: 20141012000912) do

  create_table "beers", force: true do |t|
    t.string   "name"
    t.string   "header"
    t.string   "category"
    t.string   "brewer"
    t.string   "alc"
    t.string   "description"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pricing"
  end

  create_table "containers", force: true do |t|
    t.integer  "volume"
    t.string   "type"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beer_id"
  end

  create_table "prices", force: true do |t|
    t.integer  "beer_id"
    t.integer  "volume"
    t.integer  "quantity"
    t.string   "container_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
  end

end
