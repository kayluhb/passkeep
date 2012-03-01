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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120216002547) do

  create_table "entries", :force => true do |t|
    t.integer  "project_id"
    t.string   "guid",               :limit => 36, :null => false
    t.string   "title",                            :null => false
    t.string   "search_text"
    t.string   "encrypted_username"
    t.string   "encrypted_password"
    t.string   "encrypted_url"
    t.text     "encrypted_notes"
    t.datetime "expiration"
    t.string   "attachment_uid"
    t.string   "attachment_name"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "entries", ["guid"], :name => "index_entries_on_guid", :unique => true
  add_index "entries", ["project_id"], :name => "index_entries_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "guid",       :limit => 36,                :null => false
    t.string   "name",                                    :null => false
    t.integer  "status_id",                :default => 1, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "projects", ["guid"], :name => "index_projects_on_guid", :unique => true
  add_index "projects", ["status_id"], :name => "index_projects_on_status_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["tagger_id", "tagger_type"], :name => "index_taggings_on_tagger_id_and_tagger_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "team_members", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "team_members", ["team_id"], :name => "index_team_members_on_team_id"
  add_index "team_members", ["user_id"], :name => "index_team_members_on_user_id"

  create_table "team_projects", :force => true do |t|
    t.integer  "project_id", :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "team_projects", ["project_id"], :name => "index_team_projects_on_project_id"
  add_index "team_projects", ["team_id"], :name => "index_team_projects_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "guid",       :limit => 36,                :null => false
    t.string   "name",                                    :null => false
    t.integer  "role_id",                  :default => 1, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "teams", ["guid"], :name => "index_teams_on_guid", :unique => true
  add_index "teams", ["role_id"], :name => "index_teams_on_role_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",                           :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",                           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name",                                                                      :null => false
    t.string   "last_name",                                                                       :null => false
    t.string   "guid",                   :limit => 36,                                            :null => false
    t.string   "time_zone",                             :default => "Eastern Time (US & Canada)"
    t.boolean  "super_user",                            :default => false
    t.boolean  "administrator",                         :default => false
    t.datetime "created_at",                                                                      :null => false
    t.datetime "updated_at",                                                                      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["guid"], :name => "index_users_on_guid", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
