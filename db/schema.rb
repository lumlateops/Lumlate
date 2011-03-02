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

ActiveRecord::Schema.define(:version => 20110302033337) do

  create_table "companies", :force => true do |t|
    t.string   "domain",     :null => false
    t.string   "name",       :null => false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["domain"], :name => "index_companies_on_domain", :unique => true

  create_table "deal_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "external_id",     :null => false
    t.string   "title",           :null => false
    t.text     "description"
    t.float    "maxvalue"
    t.datetime "expiry"
    t.integer  "company_id",      :null => false
    t.integer  "subscription_id"
    t.integer  "deal_type_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["company_id"], :name => "index_deals_on_company_id"
  add_index "deals", ["external_id"], :name => "index_deals_on_external_id"
  add_index "deals", ["subscription_id"], :name => "index_deals_on_subscription_id"

  create_table "deals_users", :id => false, :force => true do |t|
    t.integer "deal_id"
    t.integer "user_id"
  end

  add_index "deals_users", ["deal_id"], :name => "index_deals_users_on_deal_id"
  add_index "deals_users", ["user_id"], :name => "index_deals_users_on_user_id"

  create_table "email_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "external_id",     :null => false
    t.date     "sent",            :null => false
    t.string   "from",            :null => false
    t.string   "to",              :null => false
    t.string   "userdata"
    t.integer  "user_id",         :null => false
    t.integer  "subscription_id"
    t.integer  "deal_id"
    t.integer  "email_type_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["deal_id"], :name => "index_emails_on_deal_id"
  add_index "emails", ["external_id"], :name => "index_emails_on_external_id"
  add_index "emails", ["subscription_id"], :name => "index_emails_on_subscription_id"
  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "locations", :force => true do |t|
    t.text     "address"
    t.string   "zipcode",    :null => false
    t.string   "city",       :null => false
    t.string   "state",      :null => false
    t.integer  "company_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["company_id"], :name => "index_locations_on_company_id"

  create_table "subscription_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "external_id",          :null => false
    t.string   "url",                  :null => false
    t.string   "title",                :null => false
    t.integer  "company_id",           :null => false
    t.integer  "subscription_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["company_id"], :name => "index_subscriptions_on_company_id"
  add_index "subscriptions", ["external_id"], :name => "index_subscriptions_on_external_id"

  create_table "subscriptions_users", :id => false, :force => true do |t|
    t.integer "subscription_id"
    t.integer "user_id"
  end

  add_index "subscriptions_users", ["subscription_id"], :name => "index_subscriptions_users_on_subscription_id"
  add_index "subscriptions_users", ["user_id"], :name => "index_subscriptions_users_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",     :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",     :null => false
    t.string   "password_salt",                       :default => "",     :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                :default => "none"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
