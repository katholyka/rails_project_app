class AddUserIdToMechanics < ActiveRecord::Migration
  def self.up
    add_column :mechanics, :user_id, :integer
  end

  def self.down
    remove_column :mechanics, :user_id
  end
end
