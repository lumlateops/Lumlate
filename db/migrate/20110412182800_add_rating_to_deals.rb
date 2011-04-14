class AddRatingToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :rating, :decimal, :default => 0
  end

  def self.down
    remove_column :deals, :rating
  end
end

