class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_content
    end
  end
end
