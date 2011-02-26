class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :domain
      t.text :address
      t.string :zipcode
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
