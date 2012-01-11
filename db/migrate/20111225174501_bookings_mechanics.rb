class BookingsMechanics < ActiveRecord::Migration
  def self.up
      create_table :bookings_mechanics, :id => false do |t|
          t.integer :booking_id
          t.integer :mechanic_id
      end
  end

  def self.down
      drop_table :bookings_mechanics
  end
end
