class AddNewcolsToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :email_domain, :string
    add_column :subscriptions, :domain, :string
    add_column :subscriptions, :form_data, :string
    add_column :subscriptions, :submit_method, :string
    change_column :subscriptions, :url, :string, :null => true
    change_column :subscriptions, :title, :string, :null => true
    add_index :subscriptions, :email_domain, :unique => true
    add_index :subscriptions, :domain
    remove_column :subscriptions, :external_id
  end

  def self.down
    remove_column :subscriptions, :submit_method
    remove_column :subscriptions, :form_data
    remove_column :subscriptions, :domain
    remove_column :subscriptions, :email_domain
    change_column :subscriptions, :url, :string, :null => false
    change_column :subscriptions, :title, :string, :null => false
    remove_index :subscriptions, :email_domain
    remove_index :subscriptions, :domain
    add_column :subscriptions, :external_id
  end
end
