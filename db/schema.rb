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

ActiveRecord::Schema.define(:version => 20110428150706) do

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.string   "encrypted_username"
    t.string   "encrypted_password"
    t.string   "encrypted_url"
    t.text     "encrypted_notes"
    t.datetime "expiration"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.string   "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entry_tags", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_tags", ["entry_id"], :name => "index_entry_tags_on_entry_id"
  add_index "entry_tags", ["tag_id"], :name => "index_entry_tags_on_tag_id"

  create_table "entry_teams", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_teams", ["entry_id"], :name => "index_entry_teams_on_entry_id"
  add_index "entry_teams", ["team_id"], :name => "index_entry_teams_on_team_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "team_users", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_users", ["team_id"], :name => "index_team_users_on_team_id"
  add_index "team_users", ["user_id"], :name => "index_team_users_on_user_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",                           :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",                           :null => false
    t.string   "password_salt",                       :default => "",                           :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name",                                                                    :null => false
    t.string   "last_name",                                                                     :null => false
    t.string   "time_zone",                           :default => "Eastern Time (US & Canada)", :null => false
    t.integer  "status",                              :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
