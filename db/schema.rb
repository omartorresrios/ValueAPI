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

ActiveRecord::Schema.define(version: 2019_05_09_172446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "total_reviews_count", default: 0
    t.integer "total_empl_who_recognized_counter", default: 0, null: false
    t.integer "total_empl_that_were_recognized_counter", default: 0, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_reviews_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "google_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "password_digest"
    t.string "job_description"
    t.string "position"
    t.string "fcm_token"
    t.bigint "department_id"
    t.bigint "company_id"
    t.boolean "is_admin"
    t.integer "send_reviews_count", default: 0
    t.integer "received_reviews_count", default: 0
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["google_id"], name: "index_users_on_google_id"
  end

  create_table "valueings", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_valueings_on_review_id"
    t.index ["value_id"], name: "index_valueings_on_value_id"
  end

  create_table "values", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_values_on_company_id"
  end

  add_foreign_key "departments", "companies"
  add_foreign_key "reviews", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "departments"
  add_foreign_key "valueings", "\"values\"", column: "value_id"
  add_foreign_key "valueings", "reviews"
  add_foreign_key "values", "companies"
end
