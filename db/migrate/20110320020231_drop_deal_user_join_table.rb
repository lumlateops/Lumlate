class DropDealUserJoinTable < ActiveRecord::Migration
  def self.up
    drop_table :deals_users
  end
  def self.down
    create_table :deals_users, :id => false do |t|
      t.integer :deal_id
      t.integer :user_id
    end
    add_index :deals_users, :deal_id
    add_index :deals_users, :user_id
  end
end
