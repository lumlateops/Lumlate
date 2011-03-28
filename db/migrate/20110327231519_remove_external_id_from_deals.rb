class RemoveExternalIdFromDeals < ActiveRecord::Migration
  def self.up
    remove_column :deals, :external_id
    change_column :deals, :title, :string, :null => true
  end

  def self.down
    add_column :deals, :external_id, :string, :null => false
    change_column :deals, :title, :string, :null => false
  end
end
