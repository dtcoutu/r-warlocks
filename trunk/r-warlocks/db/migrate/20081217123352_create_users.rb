class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	  t.string :userid, :null => false
	  t.string :password, :limit => 32, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
