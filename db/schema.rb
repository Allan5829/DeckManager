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

ActiveRecord::Schema.define(version: 2020_09_04_125644) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "count"
    t.boolean "basic_energy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "shared"
    t.string "player_name"
    t.integer "tournament_id"
    t.integer "tournament_placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "event_name"
    t.string "event_date"
    t.boolean "finished"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_decks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
