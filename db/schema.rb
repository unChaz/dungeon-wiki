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

ActiveRecord::Schema.define(version: 20180904162859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "encounters", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "campaign_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "monster_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "foreign_key"
    t.integer  "armor_class"
    t.integer  "max_hit_points"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "hit_dice"
    t.string   "speed"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.integer  "stealth"
    t.string   "damage_vulnerabilities"
    t.string   "damage_resistances"
    t.string   "damage_immunities"
    t.string   "condition_immunities"
    t.string   "senses"
    t.string   "languages"
    t.text     "special_abilities",      default: [],              array: true
    t.string   "url"
    t.string   "subtype"
    t.string   "alignment"
    t.integer  "constitution_save"
    t.integer  "wisdom_save"
    t.integer  "dexterity_save"
    t.integer  "intelligence_save"
    t.integer  "charisma_save"
    t.integer  "history"
    t.integer  "perception"
    t.text     "legendary_actions",      default: [],              array: true
    t.text     "actions",                default: [],              array: true
    t.integer  "experience"
    t.float    "challenge_rating"
    t.string   "category"
    t.string   "size"
    t.integer  "medicine"
    t.integer  "religion"
    t.integer  "persuasion"
    t.integer  "insight"
    t.integer  "deception"
    t.integer  "arcana"
    t.integer  "athletics"
    t.integer  "acrobatics"
    t.integer  "strength_save"
    t.text     "reactions",              default: [],              array: true
    t.integer  "survival"
    t.integer  "investigation"
    t.integer  "nature"
    t.integer  "intimidation"
    t.integer  "performance"
  end

  create_table "monster_pools", force: :cascade do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "keys",              default: [],              array: true
    t.integer  "monster_class_ids", default: [],              array: true
  end

  create_table "monsters", force: :cascade do |t|
    t.integer  "encounter_id"
    t.integer  "armor_class"
    t.string   "monster_key"
    t.string   "name"
    t.integer  "initiative"
    t.integer  "hit_points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "armor_class"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "spells", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.boolean  "content_creator"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wiki_page_versions", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "updated_at"
    t.index ["page_id"], name: "index_wiki_page_versions_on_page_id", using: :btree
    t.index ["updator_id"], name: "index_wiki_page_versions_on_updator_id", using: :btree
  end

  create_table "wiki_pages", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["creator_id"], name: "index_wiki_pages_on_creator_id", using: :btree
    t.index ["path"], name: "index_wiki_pages_on_path", unique: true, using: :btree
  end

end
