class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
	  t.integer :num_challengers, :null => false
	  t.string :status, :null => false, :default => "Open"
      t.timestamps
    end
	
	add_index :matches, :num_challengers, :unique => true
	add_index :matches, :status
  end

  def self.down
	remove_index :matches, :num_challengers
	remove_index :matches, :status
  
    drop_table :matches
  end
end
