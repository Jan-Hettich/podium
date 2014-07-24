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

ActiveRecord::Schema.define(version: 20140716002431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ext_topics", force: true do |t|
    t.string   "title",       default: "",    null: false
    t.text     "description", default: "",    null: false
    t.boolean  "deleted",     default: false, null: false
    t.string   "base_uuid",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ext_topics", ["base_uuid"], name: "index_ext_topics_on_base_uuid", using: :btree

  create_table "topics", id: false, force: true do |t|
    t.integer  "ext_id",                     null: false
    t.string   "uuid",                       null: false
    t.boolean  "deleted",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["ext_id"], name: "index_topics_on_ext_id", unique: true, using: :btree
  add_index "topics", ["uuid"], name: "index_topics_on_uuid", unique: true, using: :btree

end
