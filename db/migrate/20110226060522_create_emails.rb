class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :id, :null => false
      t.date :sent, :null => false
      t.string :from, :null => false
      t.string :to, :null => false
      t.enum :type, :null => false
      t.string :userdata
      t.integer :user_id, :null => false
      t.integer :subscription_id
      t.integer :deal_id

      t.timestamps
    end

    add_index :emails, :subscription_id
    add_index :emails, :deal_id
    add_index :emails, :user_id
    add_index :emails, :id
  end


  def self.down
    drop_table :emails
  end
end
