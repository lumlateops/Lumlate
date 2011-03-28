class DropSubscriptionUserJoinTable < ActiveRecord::Migration
  def self.up
    drop_table :subscriptions_users
  end

  def self.down
    create_table :subscriptions_users, :id => false do |t|
      t.integer :subscription_id
      t.integer :user_id
    end
    add_index :subscriptions_users, :subscription_id
    add_index :subscriptions_users, :user_id
  end
end
