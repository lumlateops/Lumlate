class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.text :address
      t.string :zipcode, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.integer :company_id, :null => false

      t.timestamps
    end
    add_index :locations, :company_id
  end

  def self.down
    drop_table :locations
  end
end
