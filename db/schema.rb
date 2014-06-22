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

ActiveRecord::Schema.define(version: 20140622175235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: true do |t|
    t.string   "guid",               limit: 36,             null: false
    t.string   "title",                                     null: false
    t.string   "search_text"
    t.string   "encrypted_username"
    t.string   "encrypted_password"
    t.string   "encrypted_url"
    t.text     "encrypted_notes"
    t.string   "attachment_uid"
    t.string   "attachment_name"
    t.datetime "expiration"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_email"
    t.integer  "status_id",                     default: 1
  end

  add_index "entries", ["project_id"], name: "index_entries_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "guid",          limit: 36,             null: false
    t.string   "name"
    t.integer  "status_id",                default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entries_count",            default: 0
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "team_members", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree
  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id", using: :btree

  create_table "team_projects", force: true do |t|
    t.integer  "team_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_projects", ["project_id"], name: "index_team_projects_on_project_id", using: :btree
  add_index "team_projects", ["team_id"], name: "index_team_projects_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "guid",       limit: 36,                 null: false
    t.boolean  "master",                default: false
    t.integer  "role_id",               default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",                           null: false
    t.string   "encrypted_password",                default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                   default: 0,                            null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name",                                                               null: false
    t.string   "last_name",                                                                null: false
    t.string   "guid",                   limit: 36,                                        null: false
    t.string   "time_zone",                         default: "Eastern Time (US & Canada)"
    t.boolean  "super_user",                        default: false
    t.boolean  "administrator",                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
