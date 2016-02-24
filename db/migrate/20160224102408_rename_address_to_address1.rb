class RenameAddressToAddress1 < ActiveRecord::Migration
  def change
    rename_column :properties, :address, :address1 
  end
end
