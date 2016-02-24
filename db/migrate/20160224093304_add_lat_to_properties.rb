class AddLatToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :lat, :float
  end
end
