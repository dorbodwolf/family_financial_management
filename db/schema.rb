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

ActiveRecord::Schema.define(version: 20200629150135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "general_income",   default: "0.0"
    t.decimal  "general_expenses", default: "0.0"
    t.decimal  "other_income",     default: "0.0"
    t.decimal  "other_expenses",   default: "0.0"
    t.string   "label"
    t.string   "memo"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "expense_leaf_types", force: :cascade do |t|
    t.string  "leaftype"
    t.integer "expense_sub_type_id"
    t.index ["expense_sub_type_id"], name: "index_expense_leaf_types_on_expense_sub_type_id", using: :btree
  end

  create_table "expense_sub_types", force: :cascade do |t|
    t.string  "subtype"
    t.integer "expense_type_id"
    t.index ["expense_type_id"], name: "index_expense_sub_types_on_expense_type_id", using: :btree
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "expense_type"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "expense_type"
    t.decimal  "value"
    t.string   "subtype"
    t.string   "detailtype"
    t.datetime "credit_day"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "marks"
    t.index ["user_id"], name: "index_expenses_on_user_id", using: :btree
  end

  create_table "income_sub_types", force: :cascade do |t|
    t.string  "subtype"
    t.integer "income_type_id"
    t.index ["income_type_id"], name: "index_income_sub_types_on_income_type_id", using: :btree
  end

  create_table "income_types", force: :cascade do |t|
    t.string "income_type"
  end

  create_table "incomes", force: :cascade do |t|
    t.string   "income_type"
    t.decimal  "value"
    t.string   "subtype"
    t.string   "detail"
    t.datetime "credit_day"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_incomes_on_user_id", using: :btree
  end

  create_table "login_logs", force: :cascade do |t|
    t.datetime "login_time"
    t.string   "ip_address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_login_logs_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_hidden",  default: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "expense_leaf_types", "expense_sub_types"
  add_foreign_key "expense_sub_types", "expense_types"
  add_foreign_key "expenses", "users"
  add_foreign_key "income_sub_types", "income_types"
  add_foreign_key "incomes", "users"
end
