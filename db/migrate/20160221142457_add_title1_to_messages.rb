class AddTitle1ToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :title, :string
  end
end


