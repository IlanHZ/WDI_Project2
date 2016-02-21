class RenamePropertys < ActiveRecord::Migration
  def change
    rename_table :propertys, :property 
  end
end
