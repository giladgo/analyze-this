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

ActiveRecord::Schema.define(version: 20160921055558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "logo_url"
    t.index ["category_id"], name: "index_merchants_on_category_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.integer  "amount",                          null: false
    t.string   "currency",        default: "ILS", null: false
    t.integer  "charge_amount",                   null: false
    t.integer  "payment_ordinal", default: 1,     null: false
    t.integer  "payment_count",   default: 1,     null: false
    t.integer  "fee_amount",      default: 0,     null: false
    t.string   "fee_currency",    default: "ILS", null: false
    t.datetime "txn_date",                        null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "merchants", "categories"
  add_foreign_key "transactions", "merchants"
  add_foreign_key "transactions", "users"
end
