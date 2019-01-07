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

ActiveRecord::Schema.define(version: 20190107020105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_tasks", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "task_id",     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.jsonb    "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recurring_events", force: :cascade do |t|
    t.string   "title"
    t.date     "anchor"
    t.integer  "frequency",  limit: 2, default: 0
    t.string   "color"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "routines", force: :cascade do |t|
    t.string   "title"
    t.text     "purpose"
    t.string   "resources"
    t.integer  "weeks"
    t.integer  "days"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_routines_on_user_id", using: :btree
  end

  create_table "schedule_zones", force: :cascade do |t|
    t.jsonb    "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.string   "description"
    t.string   "content"
    t.datetime "deadline"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "completed"
    t.datetime "completed_time"
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "time_logs", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "log"
    t.integer  "duration"
    t.integer  "user_id"
    t.integer  "task_id"
    t.index ["task_id"], name: "index_time_logs_on_task_id", using: :btree
    t.index ["user_id"], name: "index_time_logs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
