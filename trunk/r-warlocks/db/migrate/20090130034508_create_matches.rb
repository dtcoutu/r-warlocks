class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
	  t.integer :num_challengers, :null => false
      t.timestamps
    end
	
	add_index :matches, :num_challengers, :unique => true
  end

  def self.down
    drop_table :matches
  end
end
