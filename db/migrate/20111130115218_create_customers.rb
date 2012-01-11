class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :phone_number
      t.string :address
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
