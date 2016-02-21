class CreatePropertysTable < ActiveRecord::Migration
  def change
    create_table :propertys do |t|
      t.string :address
      t.string :owner
      t.string :picures
      t.string :property_type
      t.string :number_of_rooms
      t.string :price
      t.string :comment
    end
  end
end




