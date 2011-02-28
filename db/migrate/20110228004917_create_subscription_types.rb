class CreateSubscriptionTypes < ActiveRecord::Migration
  def self.up
    create_table :subscription_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_types
  end
end
