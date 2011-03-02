class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :default => 'none'
  end

  def self.down
    remove_column :users, :role
  end
end
