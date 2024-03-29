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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_193619) do
  create_table "item_hierarchies", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "item_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "item_desc_idx"
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "parent_id"
    t.string "type", null: false
    t.string "title"
    t.text "body"
    t.boolean "dead", default: false, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "url_id"
    t.integer "score", default: 0, null: false
    t.index ["parent_id"], name: "index_items_on_parent_id"
    t.index ["url_id"], name: "index_items_on_url_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "urls", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_urls_on_url", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.text "about", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "karma", default: 0, null: false
  end

  create_table "votes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.integer "vote", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_votes_on_item_id"
    t.index ["user_id", "item_id"], name: "index_votes_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "items", "items", column: "parent_id"
  add_foreign_key "items", "urls"
  add_foreign_key "items", "users"
  add_foreign_key "votes", "items"
  add_foreign_key "votes", "users"
end
