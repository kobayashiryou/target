# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_29_063010) do

  create_table "companies", charset: "utf8", force: :cascade do |t|
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "company_targets", charset: "utf8", force: :cascade do |t|
    t.string "monthly_target"
    t.string "anually_target"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "month"
    t.index ["company_id"], name: "index_company_targets_on_company_id"
  end

  create_table "department_targets", charset: "utf8", force: :cascade do |t|
    t.string "monthly_target"
    t.string "anually_target"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "month"
    t.index ["department_id"], name: "index_department_targets_on_department_id"
  end

  create_table "departments", charset: "utf8", force: :cascade do |t|
    t.string "departmentname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
    t.index ["email"], name: "index_departments_on_email", unique: true
    t.index ["reset_password_token"], name: "index_departments_on_reset_password_token", unique: true
  end

  create_table "todo_targets", charset: "utf8", force: :cascade do |t|
    t.string "body"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_todo_targets_on_department_id"
  end

  create_table "todos", charset: "utf8", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "todo_target_id", null: false
    t.index ["todo_target_id"], name: "index_todos_on_todo_target_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "tweets", charset: "utf8", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id", null: false
    t.string "image"
    t.string "profile"
    t.date "joining"
    t.string "hobby"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "company_targets", "companies"
  add_foreign_key "department_targets", "departments"
  add_foreign_key "departments", "companies"
  add_foreign_key "todo_targets", "departments"
  add_foreign_key "todos", "todo_targets"
  add_foreign_key "todos", "users"
  add_foreign_key "tweets", "users"
  add_foreign_key "users", "departments"
end
