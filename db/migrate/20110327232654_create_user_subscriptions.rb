class CreateUserSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :user_subscriptions do |t|
      t.references :user, :null => false
      t.references :subscription, :null => false
      t.references :subscription_status, :null => false

      t.timestamps
    end
    add_index :user_subscriptions, :user_id
    add_index :user_subscriptions, :subscription_id
  end

  def self.down
    drop_table :user_subscriptions
  end
end
