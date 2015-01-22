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

ActiveRecord::Schema.define(version: 20150122150947) do

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "home_site"
    t.string   "slug",        null: false
    t.integer  "country_id"
    t.integer  "city_id"
    t.string   "zip"
    t.string   "email",       null: false
    t.string   "phone"
    t.text     "address"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_categories", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "company_id",  null: false
  end

  add_index "companies_categories", ["category_id", "company_id"], name: "index_companies_categories_on_category_id_and_company_id", unique: true
  add_index "companies_categories", ["category_id"], name: "index_companies_categories_on_category_id"
  add_index "companies_categories", ["company_id", "category_id"], name: "index_companies_categories_on_company_id_and_category_id", unique: true
  add_index "companies_categories", ["company_id"], name: "index_companies_categories_on_company_id"

  create_table "company_categories", force: true do |t|
    t.integer  "subcategory_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_categories", ["company_id"], name: "index_company_categories_on_company_id"
  add_index "company_categories", ["subcategory_id"], name: "index_company_categories_on_subcategory_id"

  create_table "review_comments", force: true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.text     "comment",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_comments", ["review_id"], name: "index_review_comments_on_review_id"

  create_table "review_usefulls", force: true do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_usefulls", ["review_id"], name: "index_review_usefulls_on_review_id"

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "rating"
    t.string   "order_id"
    t.string   "review_short", null: false
    t.text     "review_full",  null: false
    t.boolean  "is_confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["company_id"], name: "index_reviews_on_company_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "root_categories", force: true do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.string   "iconName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.integer  "root_category_id"
    t.string   "name",             null: false
    t.text     "description"
    t.string   "slug",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["root_category_id"], name: "index_subcategories_on_root_category_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.boolean  "verified"
    t.integer  "country_id"
    t.integer  "city_id"
    t.date     "birth_date"
    t.text     "about"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
