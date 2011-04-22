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

ActiveRecord::Schema.define(:version => 20110412184606) do

  create_table "accounts", :force => true do |t|
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["subdomain"], :name => "index_accounts_on_subdomain", :unique => true

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
    t.string   "title"
    t.text     "description"
    t.float    "maxvalue"
    t.datetime "expiry"
    t.integer  "company_id",                                                    :null => false
    t.integer  "subscription_id"
    t.integer  "deal_type_id",                                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rating",          :precision => 10, :scale => 0, :default => 0
  end

  add_index "deals", ["company_id"], :name => "index_deals_on_company_id"
  add_index "deals", ["subscription_id"], :name => "index_deals_on_subscription_id"

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
    t.string   "subject"
    t.string   "fromname"
    t.date     "recieved"
    t.text     "content"
  end

  add_index "emails", ["deal_id"], :name => "index_emails_on_deal_id"
  add_index "emails", ["external_id"], :name => "index_emails_on_external_id", :unique => true
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

  create_table "subscription_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "company_id",           :null => false
    t.integer  "subscription_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_domain"
    t.string   "domain"
    t.string   "form_data"
    t.string   "submit_method"
  end

  add_index "subscriptions", ["company_id"], :name => "index_subscriptions_on_company_id"
  add_index "subscriptions", ["domain"], :name => "index_subscriptions_on_domain"
  add_index "subscriptions", ["email_domain"], :name => "index_subscriptions_on_email_domain", :unique => true

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

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_subscriptions", :force => true do |t|
    t.integer  "user_id",                :null => false
    t.integer  "subscription_id",        :null => false
    t.integer  "subscription_status_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_subscriptions", ["subscription_id"], :name => "index_user_subscriptions_on_subscription_id"
  add_index "user_subscriptions", ["user_id"], :name => "index_user_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                :default => "",     :null => false
    t.string   "encrypted_password",   :default => ""
    t.string   "password_salt",        :default => ""
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                 :default => "none"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.decimal  "rating",     :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
