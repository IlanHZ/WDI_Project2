class AddRecipientIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recipient_id, :string
  end
end
