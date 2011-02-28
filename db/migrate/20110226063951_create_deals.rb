class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :external_id, :null => false
      t.string :title, :null => false
      t.text :description
      t.float :maxvalue
      t.datetime :expiry
      t.integer :company_id, :null => false
      t.integer :subscription_id
      t.integer :deal_type_id, :null => false

      t.timestamps
    end
    add_index :deals, :external_id
    add_index :deals, :company_id
    add_index :deals, :subscription_id
  end

  def self.down
    drop_table :dealss
  end
end
