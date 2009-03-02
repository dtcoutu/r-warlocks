# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090301163954) do

  create_table "challenger_invites", :force => true do |t|
    t.integer  "warlock_id", :null => false
    t.integer  "match_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenger_invites", ["match_id", "warlock_id"], :name => "index_challenger_invites_on_warlock_id_and_match_id", :unique => true

  create_table "challengers", :force => true do |t|
    t.integer  "warlock_id", :null => false
    t.integer  "match_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challengers", ["match_id", "warlock_id"], :name => "index_challengers_on_warlock_id_and_match_id", :unique => true

  create_table "matches", :force => true do |t|
    t.integer  "num_challengers", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["num_challengers"], :name => "index_matches_on_num_challengers", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",                 :null => false
    t.string   "password",   :limit => 32, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "warlocks", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :null => false
  end

  add_index "warlocks", ["name"], :name => "index_warlocks_on_name", :unique => true

end
