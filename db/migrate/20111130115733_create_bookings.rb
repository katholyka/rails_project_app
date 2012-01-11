class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.integer :payement_count
      t.integer :mechanic_id
      t.integer :car_id
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
