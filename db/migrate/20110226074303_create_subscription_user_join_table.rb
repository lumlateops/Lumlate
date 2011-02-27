class CreateSubscriptionUserJoinTable < ActiveRecord::Migration
  def self.up
    create_table :subscriptions_users, :id => false do |t|
      t.integer :subscription_id
      t.integer :user_id
    end
    add_index :subscriptions_users, :subscription_id
    add_index :subscriptions_users, :user_id
  end

  def self.down
    drop_table :subscriptions_users
  end

end
