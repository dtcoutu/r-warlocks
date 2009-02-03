class CreateChallengers < ActiveRecord::Migration
  def self.up
    create_table :challengers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :challengers
  end
end
