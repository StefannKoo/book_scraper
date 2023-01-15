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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_105605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "variants", ["hardcover", "e_book", "kindle", "paperback", "audio_cd", "text_book_binding", "large_print"]

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "audit_actions", force: :cascade do |t|
    t.string "message"
    t.bigint "price_id", null: false
    t.bigint "audit_price_id", null: false
    t.bigint "audit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audit_id"], name: "index_audit_actions_on_audit_id"
    t.index ["audit_price_id"], name: "index_audit_actions_on_audit_price_id"
    t.index ["price_id"], name: "index_audit_actions_on_price_id"
  end

  create_table "audit_prices", force: :cascade do |t|
    t.decimal "amount"
    t.enum "variant", null: false, enum_type: "variants"
    t.bigint "audit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audit_id"], name: "index_audit_prices_on_audit_id"
  end

  create_table "audits", force: :cascade do |t|
    t.string "image"
    t.string "price"
    t.bigint "platform_book_id", null: false
    t.bigint "scan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_book_id"], name: "index_audits_on_platform_book_id"
    t.index ["scan_id"], name: "index_audits_on_scan_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.boolean "ebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "publisher_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "location_candidates", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "platform_book_id", null: false
    t.index ["platform_book_id"], name: "index_location_candidates_on_platform_book_id"
  end

  create_table "platform_book_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.json "metadata", default: {}
    t.integer "sort_key", null: false
    t.integer "platform_book_id", null: false
    t.boolean "most_recent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_book_id", "most_recent"], name: "index_platform_book_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["platform_book_id", "sort_key"], name: "index_platform_book_transitions_parent_sort", unique: true
  end

  create_table "platform_books", force: :cascade do |t|
    t.bigint "platform_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "url"
    t.string "image"
    t.index ["book_id"], name: "index_platform_books_on_book_id"
    t.index ["platform_id"], name: "index_platform_books_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.text "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "territory_id", null: false
    t.index ["territory_id"], name: "index_platforms_on_territory_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "amount"
    t.enum "variant", null: false, enum_type: "variants"
    t.bigint "platform_book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_book_id"], name: "index_prices_on_platform_book_id"
  end

  create_table "publisher_platforms", force: :cascade do |t|
    t.bigint "publisher_id", null: false
    t.bigint "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_publisher_platforms_on_platform_id"
    t.index ["publisher_id"], name: "index_publisher_platforms_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adress"
  end

  create_table "scans", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "publisher_id", null: false
    t.index ["publisher_id"], name: "index_scans_on_publisher_id"
  end

  create_table "territories", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "audit_actions", "audit_prices"
  add_foreign_key "audit_actions", "audits"
  add_foreign_key "audit_actions", "prices"
  add_foreign_key "audit_prices", "audits"
  add_foreign_key "audits", "platform_books"
  add_foreign_key "audits", "scans"
  add_foreign_key "location_candidates", "platform_books"
  add_foreign_key "platform_book_transitions", "platform_books"
  add_foreign_key "platform_books", "books"
  add_foreign_key "platform_books", "platforms"
  add_foreign_key "platforms", "territories"
  add_foreign_key "prices", "platform_books"
  add_foreign_key "publisher_platforms", "platforms"
  add_foreign_key "publisher_platforms", "publishers"
  add_foreign_key "scans", "publishers"
end
