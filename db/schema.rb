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

ActiveRecord::Schema.define(version: 20160303200727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.date     "appointment_date"
  end

  add_index "appointments", ["student_id"], name: "index_appointments_on_student_id", using: :btree
  add_index "appointments", ["tutor_id"], name: "index_appointments_on_tutor_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.date     "availability"
    t.string   "picture"
    t.text     "qualification"
    t.string   "category"
    t.text     "location"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "student"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "appointments", "users", column: "student_id"
  add_foreign_key "appointments", "users", column: "tutor_id"
  add_foreign_key "profiles", "users"
end
