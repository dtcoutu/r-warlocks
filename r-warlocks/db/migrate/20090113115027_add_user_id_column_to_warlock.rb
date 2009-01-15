class AddUserIdColumnToWarlock < ActiveRecord::Migration
  def self.up
	add_column :warlocks, :user_id, :integer, :null => false
  end

  def self.down
	remove_column :warlocks, :user_id
  end
end
