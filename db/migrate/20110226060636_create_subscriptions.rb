class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.string :id, :null => false
      t.string :url, :null => false
      t.string :title, :null => false
      t.integer :company_id, :null => false

      t.timestamps
    end
    add_index :subscriptions, :company_id
    add_index :subscriptions, :id
  end

  def self.down
    drop_table :subscriptions
  end
end
