class CreateDealTypes < ActiveRecord::Migration
  def self.up
    create_table :deal_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :deal_types
  end
end
