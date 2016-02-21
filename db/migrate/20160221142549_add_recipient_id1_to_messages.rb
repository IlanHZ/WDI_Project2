class AddRecipientId1ToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recipient_id, :string
  end
end
