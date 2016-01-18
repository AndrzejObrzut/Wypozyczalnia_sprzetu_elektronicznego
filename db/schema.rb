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

ActiveRecord::Schema.define(version: 20160116071909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcement_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.binary   "image",      null: false
    t.string   "filename"
    t.string   "mime_type"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.integer  "announcement_category_id",             null: false
    t.integer  "user_id",                              null: false
    t.string   "title",                    limit: 100, null: false
    t.text     "description",                          null: false
    t.integer  "price_per_hour",                       null: false
    t.integer  "price_per_day",                        null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "announcements", ["announcement_category_id"], name: "index_announcements_on_announcement_category_id", using: :btree
  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "announcement_id",    null: false
    t.string   "image_file_name",    null: false
    t.string   "image_content_type", null: false
    t.integer  "image_file_size",    null: false
    t.datetime "image_updated_at",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "photos", ["announcement_id"], name: "index_photos_on_announcement_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",            limit: 30,                 null: false
    t.string   "password_digest"
    t.string   "first_name",           limit: 40,                 null: false
    t.string   "last_name",            limit: 40,                 null: false
    t.string   "email",                limit: 60,                 null: false
    t.string   "phone",                                           null: false
    t.date     "birth_date",                                      null: false
    t.boolean  "is_admin",                        default: false, null: false
    t.boolean  "regulations_accepted",                            null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

  add_foreign_key "announcements", "announcement_categories", on_delete: :cascade
  add_foreign_key "announcements", "users", on_delete: :cascade
  add_foreign_key "photos", "announcements", on_delete: :cascade
end
