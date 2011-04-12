class AddRatingToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :rating, :decimal
  end

  def self.down
    remove_column :deals, :rating
  end
end
