class AddUserAndWarlockIndexes < ActiveRecord::Migration
  def self.up
	add_index :users, :username, :unique => true
	add_index :warlocks, :name, :unique => true
  end

  def self.down
	remove_index :warlocks, :name
	remove_index :users, :username
  end
end
