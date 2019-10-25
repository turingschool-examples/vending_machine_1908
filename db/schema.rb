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

ActiveRecord::Schema.define(version: 20191025151317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "machines", force: :cascade do |t|
    t.string "location"
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_machines_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.bigint "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_snacks_on_machine_id"
  end

  add_foreign_key "machines", "owners"
  add_foreign_key "snacks", "machines"
end
