# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_11_095310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_details", force: :cascade do |t|
    t.bigint "earning_rule_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.decimal "point_balance", precision: 8, scale: 2, null: false
    t.string "event"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["earning_rule_id"], name: "index_customer_details_on_earning_rule_id"
    t.index ["email"], name: "index_customer_details_on_email", unique: true
    t.index ["name"], name: "index_customer_details_on_name"
    t.index ["point_balance"], name: "index_customer_details_on_point_balance"
  end

  create_table "earning_rules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "point", null: false
    t.boolean "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_earning_rules_on_name"
    t.index ["point"], name: "index_earning_rules_on_point"
    t.index ["status"], name: "index_earning_rules_on_status"
    t.index ["user_id"], name: "index_earning_rules_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_details", "earning_rules"
  add_foreign_key "earning_rules", "users"
end
