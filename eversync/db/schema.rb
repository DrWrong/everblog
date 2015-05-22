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

ActiveRecord::Schema.define(version: 20150521103301) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title",               limit: 255,   default: ""
    t.text     "content",             limit: 65535
    t.boolean  "published",           limit: 1,     default: false
    t.string   "guid",                limit: 255,   default: ""
    t.integer  "update_sequence_num", limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "blogs", ["guid"], name: "index_blogs_on_guid", unique: true, using: :btree

  create_table "blogs_tags", id: false, force: :cascade do |t|
    t.integer "blog_id", limit: 4, null: false
    t.integer "tag_id",  limit: 4, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.string   "guid",       limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "tags", ["guid"], name: "index_tags_on_guid", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255, default: ""
    t.string   "auth_token",    limit: 255, default: ""
    t.string   "notebook_name", limit: 255, default: "tech"
    t.string   "notebook_id",   limit: 255, default: ""
    t.integer  "evernote_id",   limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["evernote_id"], name: "index_users_on_evernote_id", unique: true, using: :btree

end
