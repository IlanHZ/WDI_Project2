class AddLngToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :lng, :float
  end
end
