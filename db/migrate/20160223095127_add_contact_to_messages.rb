class AddContactToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contact, :string
  end
end
