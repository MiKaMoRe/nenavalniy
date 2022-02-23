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

ActiveRecord::Schema.define(version: 2021_10_26_094054) do

  create_table "carts", force: :cascade do |t|
    t.boolean "is_order", default: false, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"user_id\", \"cart_id\"", name: "index_carts_on_user_id_and_cart_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_products", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.index ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "article", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "price", null: false
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products_properties", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "property_id", null: false
    t.string "value", null: false
    t.index ["product_id", "property_id"], name: "index_products_properties_on_product_id_and_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "type", default: "User", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "users"
end
