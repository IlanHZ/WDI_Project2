helpers do

  def message_count
    current_user.received_messages.count
  end

end