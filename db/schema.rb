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

ActiveRecord::Schema.define(version: 2021_11_29_132915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "code"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "demands", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "building_id", null: false
    t.string "responder"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_demands_on_building_id"
    t.index ["user_id"], name: "index_demands_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "file"
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_documents_on_building_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "available"
    t.string "image"
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_materials_on_building_id"
    t.index ["user_id"], name: "index_materials_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_messages_on_building_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.bigint "building_id"
    t.index ["building_id"], name: "index_users_on_building_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "demands", "buildings"
  add_foreign_key "demands", "users"
  add_foreign_key "documents", "buildings"
  add_foreign_key "documents", "users"
  add_foreign_key "materials", "buildings"
  add_foreign_key "materials", "users"
  add_foreign_key "messages", "buildings"
  add_foreign_key "messages", "users"
  add_foreign_key "users", "buildings"
end
