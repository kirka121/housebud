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

ActiveRecord::Schema.define(version: 20160209162903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "color_code"
    t.boolean  "all_day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "todo_list_items", force: :cascade do |t|
    t.integer  "todo_list_id"
    t.string   "description"
    t.integer  "sequence"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "todo_list_items", ["todo_list_id"], name: "index_todo_list_items_on_todo_list_id", using: :btree

  create_table "todo_lists", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "title"
    t.datetime "duedate"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "todo_lists", ["event_id"], name: "index_todo_lists_on_event_id", using: :btree

end
