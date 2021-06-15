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

ActiveRecord::Schema.define(version: 2021_06_15_114649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.time "start_date"
    t.string "title"
    t.bigint "mentor_id"
    t.bigint "disciple_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciple_id"], name: "index_appointments_on_disciple_id"
    t.index ["mentor_id"], name: "index_appointments_on_mentor_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "privatemessagings", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_privatemessagings_on_recipient_id"
    t.index ["sender_id"], name: "index_privatemessagings_on_sender_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "resources_technologies", id: false, force: :cascade do |t|
    t.bigint "resource_id", null: false
    t.bigint "technology_id", null: false
    t.index ["resource_id", "technology_id"], name: "index_resources_technologies_on_resource_id_and_technology_id"
    t.index ["technology_id", "resource_id"], name: "index_resources_technologies_on_technology_id_and_resource_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.integer "mentor_level", default: 0, null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_badges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_users_badges_on_badge_id"
    t.index ["user_id"], name: "index_users_badges_on_user_id"
  end

  create_table "users_technologies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technology_id"], name: "index_users_technologies_on_technology_id"
    t.index ["user_id"], name: "index_users_technologies_on_user_id"
  end

  add_foreign_key "resources", "users"
  add_foreign_key "users_badges", "badges"
  add_foreign_key "users_badges", "users"
  add_foreign_key "users_technologies", "technologies"
  add_foreign_key "users_technologies", "users"
end
