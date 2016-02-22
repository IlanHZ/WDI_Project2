class AddProfilPicToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :profile_pic, :string 
  end
end
