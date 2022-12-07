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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_175002) do
  create_table "accesses", force: :cascade do |t|
    t.integer "User_id", null: false
    t.integer "MIDI_file_id", null: false
    t.boolean "can_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["MIDI_file_id"], name: "index_accesses_on_MIDI_file_id"
    t.index ["User_id"], name: "index_accesses_on_User_id"
  end

  create_table "links", force: :cascade do |t|
    t.integer "MIDI_file_id", null: false
    t.datetime "time_to_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["MIDI_file_id"], name: "index_links_on_MIDI_file_id"
  end

  create_table "midi_files", force: :cascade do |t|
    t.string "filename"
    t.string "song_name"
    t.string "author"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accesses", "MIDI_files"
  add_foreign_key "accesses", "Users"
  add_foreign_key "links", "MIDI_files"
end
