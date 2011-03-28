class AddFromnameToEmails < ActiveRecord::Migration
  def self.up
    add_column :emails, :fromname, :string
    add_column :emails, :recieved, :date
    add_column :emails, :content, :text
    remove_index :emails, :external_id
    add_index :emails, :external_id, :unique => true
  end

  def self.down
    remove_column :emails, :fromname
    remove_column :emails, :recieved
    remove_column :emails, :content
    remove_index :emails, :external_id
    add_index :emails, :external_id
  end
end
