class CreateDealUserJoinTable < ActiveRecord::Migration
  def self.up
    create_table :deals_users, :id => false do |t|
      t.integer :deal_id
      t.integer :user_id
    end
    add_index :deals_users, :deal_id
    add_index :deals_users, :user_id
  end

  def self.down
    drop_table :deals_users
  end
end
