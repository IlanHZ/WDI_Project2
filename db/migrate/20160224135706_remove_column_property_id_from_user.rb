class RemoveColumnPropertyIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :property_id 
  end
end
