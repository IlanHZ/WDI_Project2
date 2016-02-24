class AddPostcode1ToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :postcode, :string
  end
end
