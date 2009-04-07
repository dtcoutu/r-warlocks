class CreateGestures < ActiveRecord::Migration
  def self.up
    create_table :gestures do |t|
	  t.integer :order_id, :null => false
	  t.string :gesture, :null => false
	  t.string :spell
	  t.string :target
      t.timestamps
    end
  end

  def self.down
    drop_table :gestures
  end
end
