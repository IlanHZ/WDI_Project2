class RenamePropertysToProperties < ActiveRecord::Migration
  def change
    rename_table :property, :properties 
  end
end
