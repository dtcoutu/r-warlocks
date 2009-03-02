class CreateChallengerInvites < ActiveRecord::Migration
  def self.up
    create_table :challenger_invites do |t|
      t.integer :warlock_id, :null => false
	  t.integer :match_id, :null => false
      t.timestamps
    end
	
	add_index :challenger_invites, [:warlock_id, :match_id], :unique => true
  end

  def self.down
	remove_index :challenger_invites, :column => [:warlock_id, :match_id]
  
    drop_table :challenger_invites
  end
end
