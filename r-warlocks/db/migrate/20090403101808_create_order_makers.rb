class CreateOrderMakers < ActiveRecord::Migration
  def self.up
    create_table :order_makers do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :order_makers
  end
end
