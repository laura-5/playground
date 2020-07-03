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

ActiveRecord::Schema.define(version: 2020_07_03_100557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activites", force: :cascade do |t|
    t.string "nom"
    t.string "heure"
    t.text "description"
    t.string "adresse"
    t.string "jour"
    t.string "categorie"
    t.string "type_activite"
    t.integer "prix"
    t.string "formule"
    t.bigint "entreprise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entreprise_id"], name: "index_activites_on_entreprise_id"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.string "jour"
    t.string "heure"
    t.integer "num_siret"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_entreprises_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "entreprise_id", null: false
    t.bigint "activite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activite_id"], name: "index_reservations_on_activite_id"
    t.index ["entreprise_id"], name: "index_reservations_on_entreprise_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
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

  add_foreign_key "activites", "entreprises"
  add_foreign_key "entreprises", "users"
  add_foreign_key "reservations", "activites"
  add_foreign_key "reservations", "entreprises"
  add_foreign_key "reservations", "users"
end
