class AddUserIdToManufacturers < ActiveRecord::Migration
  def self.up
    add_column :manufacturers, :user_id, :integer
  end

  def self.down
    remove_column :manufacturers, :user_id
  end
end
