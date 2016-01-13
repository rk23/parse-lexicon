# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160113164326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "texts", force: :cascade do |t|
    t.string   "link"
    t.string   "language"
    t.string   "author"
    t.string   "img_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_languages", force: :cascade do |t|
    t.text     "session_language"
    t.boolean  "current_language"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "user_languages", ["user_id"], name: "index_user_languages_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_words", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_words", ["user_id"], name: "index_users_words_on_user_id", using: :btree
  add_index "users_words", ["word_id"], name: "index_users_words_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "understood_word"
    t.string   "language"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "user_languages", "users"
  add_foreign_key "users_words", "users"
  add_foreign_key "users_words", "words"
end
