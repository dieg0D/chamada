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

ActiveRecord::Schema.define(version: 2019_01_17_024330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendance_lists", force: :cascade do |t|
    t.date "data"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.index ["type_id"], name: "index_attendance_lists_on_type_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "attendance_list_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_list_id"], name: "index_statuses_on_attendance_list_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "type_id", null: false
    t.index ["type_id", "user_id"], name: "index_types_users_on_type_id_and_user_id"
    t.index ["user_id", "type_id"], name: "index_types_users_on_user_id_and_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.boolean "membro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nucleo"
    t.boolean "active", default: true, null: false
  end

  add_foreign_key "attendance_lists", "types"
end
