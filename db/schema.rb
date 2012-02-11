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

ActiveRecord::Schema.define(:version => 20120115231613) do

  create_table "entries", :force => true do |t|
    t.string   "guid",                    :limit => 36
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
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

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
    t.string   "guid",                   :limit => 36
    t.string   "time_zone",                             :default => "Eastern Time (US & Canada)"
    t.datetime "created_at",                                                                      :null => false
    t.datetime "updated_at",                                                                      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
