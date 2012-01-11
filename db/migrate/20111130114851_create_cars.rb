class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.integer :engine_size
      t.integer :model_id
      t.integer :customer_id
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
