class CreateWarlocks < ActiveRecord::Migration
  def self.up
    create_table :warlocks do |t|
	  t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :warlocks
  end
end
