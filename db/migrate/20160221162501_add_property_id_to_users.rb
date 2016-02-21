class AddPropertyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :property_id, :integer
  end
end
