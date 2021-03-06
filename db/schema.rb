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

ActiveRecord::Schema.define(version: 2021_12_06_104019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "booker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "material_id"
    t.index ["booker_id"], name: "index_bookings_on_booker_id"
    t.index ["material_id"], name: "index_bookings_on_material_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "code"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "demands", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "building_id", null: false
    t.bigint "responder_id"
    t.bigint "requester_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_demands_on_building_id"
    t.index ["requester_id"], name: "index_demands_on_requester_id"
    t.index ["responder_id"], name: "index_demands_on_responder_id"
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
    t.datetime "start_time"
    t.datetime "end_time"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "materials"
  add_foreign_key "bookings", "users", column: "booker_id"
  add_foreign_key "demands", "buildings"
  add_foreign_key "demands", "users", column: "requester_id"
  add_foreign_key "demands", "users", column: "responder_id"
  add_foreign_key "documents", "buildings"
  add_foreign_key "documents", "users"
  add_foreign_key "materials", "buildings"
  add_foreign_key "materials", "users"
  add_foreign_key "messages", "buildings"
  add_foreign_key "messages", "users"
  add_foreign_key "users", "buildings"
end
