class CreateMechanics < ActiveRecord::Migration
  def self.up
    create_table :mechanics do |t|
      t.string :mechanic_name
      t.string :phone_number
      t.text :details
      t.integer :booking_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mechanics
  end
end
