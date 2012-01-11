class AddManufacturerIdToModel < ActiveRecord::Migration
  def self.up
      add_column :models, :manufacturer_id, :integer
  end

  def self.down
      remove_column :models, :manufacturer_id
  end
end
