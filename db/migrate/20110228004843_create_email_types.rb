class CreateEmailTypes < ActiveRecord::Migration
  def self.up
    create_table :email_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :email_types
  end
end
