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

ActiveRecord::Schema.define(version: 2020_12_13_103217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_services", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "service_id", null: false
    t.float "quantity"
    t.float "total_price_service"
    t.index ["bill_id"], name: "index_bill_services_on_bill_id"
    t.index ["service_id"], name: "index_bill_services_on_service_id"
  end

  create_table "bills", force: :cascade do |t|
    t.string "ref_bill"
    t.bigint "customer_id", null: false
    t.text "description"
    t.float "deposit"
    t.float "price_duty_free"
    t.float "price_all_taxes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.integer "bill_status", default: 0
    t.index ["customer_id"], name: "index_bills_on_customer_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "postcode"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.string "siret"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.float "tva"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "ref_client"
    t.string "name"
    t.string "address"
    t.integer "postcode"
    t.string "city"
    t.string "phone_1"
    t.string "phone_2"
    t.string "email_1"
    t.string "email_2"
    t.string "siren"
    t.string "siret"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "quote_services", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantity"
    t.float "total_price_service"
    t.index ["quote_id"], name: "index_quote_services_on_quote_id"
    t.index ["service_id"], name: "index_quote_services_on_service_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "ref_quote"
    t.bigint "customer_id", null: false
    t.text "description"
    t.float "deposit"
    t.float "price_duty_free"
    t.float "price_all_taxes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.integer "quote_status", default: 0
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "ref_service"
    t.string "description_service"
    t.integer "unit_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bill_services", "bills"
  add_foreign_key "bill_services", "services"
  add_foreign_key "bills", "customers"
  add_foreign_key "customers", "companies"
  add_foreign_key "quote_services", "quotes"
  add_foreign_key "quote_services", "services"
  add_foreign_key "quotes", "customers"
  add_foreign_key "services", "companies"
end
