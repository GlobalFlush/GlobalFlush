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

ActiveRecord::Schema.define(:version => 20110421011355) do

  create_table "addresses", :force => true do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "bathroom_id"
    t.string   "inside_location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip"
  end

  create_table "bathroom_specs", :force => true do |t|
    t.integer  "bathroom_id"
    t.string   "key",                        :null => false
    t.string   "value",                      :null => false
    t.integer  "moderated",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bathrooms", :force => true do |t|
    t.string   "title"
    t.string   "gender"
    t.integer  "user_id"
    t.text     "description"
    t.boolean  "hidden",      :default => true
    t.integer  "moderated",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "bathroom_id"
    t.integer  "user_id"
    t.string   "body"
    t.integer  "moderated",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graffiti", :force => true do |t|
    t.integer  "bathroom_id"
    t.string   "name",                       :null => false
    t.string   "description"
    t.integer  "moderated",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.boolean  "moderated",          :default => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "bathroom_id"
    t.integer  "smell",       :null => false
    t.integer  "clean",       :null => false
    t.integer  "overall",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
