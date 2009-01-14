class AddUserIdColumnToWarlock < ActiveRecord::Migration
  def self.up
	add_column :warlocks, :userid, :integer, :null => false
  end

  def self.down
	remove_column :warlocks, :userid
  end
end
