class AddContactInputToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contact_input, :string
  end
end
