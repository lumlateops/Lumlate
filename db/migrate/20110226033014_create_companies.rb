class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :domain, :null => false
      t.string :name, :null => false
      t.string :image

      t.timestamps
    end
    add_index :companies, :domain, :unique => true
  end

  def self.down
    drop_table :companies
  end
end
