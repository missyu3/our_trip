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

ActiveRecord::Schema.define(version: 2020_10_08_134656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "plan_item_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_item_id"], name: "index_comments_on_plan_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "notify_id"
    t.bigint "notified_id"
    t.string "event_type"
    t.bigint "event_id"
    t.integer "action"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type", "event_id"], name: "index_notifications_on_event_type_and_event_id"
    t.index ["notified_id"], name: "index_notifications_on_notified_id"
    t.index ["notify_id"], name: "index_notifications_on_notify_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id", "user_id"], name: "index_participants_on_plan_id_and_user_id", unique: true
    t.index ["plan_id"], name: "index_participants_on_plan_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "plan_items", force: :cascade do |t|
    t.bigint "plan_id"
    t.string "title"
    t.integer "category"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["plan_id"], name: "index_plan_items_on_plan_id"
    t.index ["user_id"], name: "index_plan_items_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "plan_item_id"
    t.datetime "start_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["plan_id"], name: "index_schedules_on_plan_id"
    t.index ["plan_item_id"], name: "index_schedules_on_plan_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "notifications", "users", column: "notified_id"
  add_foreign_key "notifications", "users", column: "notify_id"
  add_foreign_key "participants", "plans"
  add_foreign_key "participants", "users"
  add_foreign_key "plan_items", "plans"
  add_foreign_key "plan_items", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "schedules", "plan_items"
  add_foreign_key "schedules", "plans"
end
