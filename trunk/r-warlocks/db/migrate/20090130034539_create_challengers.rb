class CreateChallengers < ActiveRecord::Migration
  def self.up
    create_table :challengers do |t|
      t.integer :warlock_id, :null => false
	  t.integer :match_id, :null => false
      t.timestamps
    end
	
	add_index :challengers, [:warlock_id, :match_id], :unique => true

  end

  def self.down
    drop_table :challengers
  end
end
