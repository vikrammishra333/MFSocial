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

ActiveRecord::Schema.define(:version => 20120516063649) do

  create_table "account_albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "hometown"
    t.string   "home_state"
    t.string   "home_country"
    t.string   "home_zip"
    t.string   "current_town"
    t.string   "current_state"
    t.string   "current_country"
    t.string   "current_zip"
    t.string   "mobile_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "avtar_file_name"
    t.string   "avtar_content_type"
    t.integer  "avtar_file_size"
    t.datetime "avtar_updated_at"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "by_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.text     "about_you"
    t.text     "favourite_quotation"
    t.string   "relationship_status"
    t.string   "inetrested_in"
    t.string   "religious_views"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
  end

  create_table "user_connection_requests", :force => true do |t|
    t.integer  "originating_user_id"
    t.integer  "requested_user_id"
    t.boolean  "accepted"
    t.string   "notes"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "user_connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "connected_user_id"
    t.string   "relationship"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.date     "date_of_birth"
    t.string   "gender",                 :limit => 6
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "profile_photo_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["profile_photo_id"], :name => "index_users_on_profile_photo_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_and_educations", :force => true do |t|
    t.string   "secondary_school"
    t.string   "sr_secondary_school"
    t.string   "college"
    t.string   "university"
    t.string   "current_employer"
    t.string   "previous_employer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
