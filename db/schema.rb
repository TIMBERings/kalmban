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

ActiveRecord::Schema.define(version: 20150124210914) do

  create_table "boards", force: true do |t|
    t.string   "title",       limit: 100
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "open",        limit: 1,     default: true
    t.integer  "position",    limit: 4
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "board_id",       limit: 4
    t.string   "position",       limit: 255
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.string   "status",         limit: 255
    t.date     "due_date"
    t.date     "completed_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "tasks", ["board_id"], name: "index_tasks_on_board_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
  end

end
