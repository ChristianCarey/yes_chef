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


ActiveRecord::Schema.define(version: 20161223055327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "categories_menu_items", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id"], name: "index_categories_menu_items_on_category_id", using: :btree
    t.index ["menu_item_id"], name: "index_categories_menu_items_on_menu_item_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_ingredients_on_user_id_and_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_ingredients_on_user_id", using: :btree
  end

  create_table "ingredients_menu_items", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_ingredients_menu_items_on_ingredient_id", using: :btree
    t.index ["menu_item_id"], name: "index_ingredients_menu_items_on_menu_item_id", using: :btree
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name",               null: false
    t.text     "description",        null: false
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "price_cents",        null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url"
    t.integer  "order_items_count", default: 0
    t.index ["name", "user_id"], name: "index_menu_items_on_name_and_user_id", using: :btree
    t.index ["user_id", "name"], name: "index_menu_items_on_user_id_and_name", using: :btree
    t.index ["user_id"], name: "index_menu_items_on_user_id", using: :btree
  end

  create_table "menu_selections", force: :cascade do |t|
    t.integer  "menu_item_id"
    t.integer  "menu_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["menu_id"], name: "index_menu_selections_on_menu_id", using: :btree
    t.index ["menu_item_id"], name: "index_menu_selections_on_menu_item_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.date     "order_deadline",              null: false
    t.date     "completion_date"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "orders_count",    default: 0
    t.index ["user_id"], name: "index_menus_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "menu_item_id"
    t.integer  "order_id"
    t.integer  "quantity",         null: false
    t.integer  "sale_price_cents", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "item_name"
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["menu_id", "customer_id"], name: "index_orders_on_menu_id_and_customer_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "chef_id"
    t.integer  "placed_orders_count"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories_menu_items", "categories"
  add_foreign_key "categories_menu_items", "menu_items"
  add_foreign_key "ingredients", "users"
  add_foreign_key "ingredients_menu_items", "ingredients"
  add_foreign_key "ingredients_menu_items", "menu_items"
  add_foreign_key "menu_selections", "menu_items"
  add_foreign_key "menu_selections", "menus"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "profiles", "users"
end
