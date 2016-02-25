# INDEX

get "/messages" do
  authorize!
  @messages = current_user.received_messages
  erb :"messages/index"
end

# NEW
get "/messages/new" do
  @recipient =  User.find(params[:recipient_id])
  @message = Message.new
  erb :"messages/new"
end

# CREATE
post "/messages" do
  recipient =  User.find(params[:recipient_id])
  @message = Message.new(params[:message])
  @message.recipient = recipient
  @message.sender = current_user
  
  if @message.save
    redirect "/messages"
  else
    erb :"messages/new"
  end
end

# SHOW
get "/messages/:id" do
  @message = Message.find(params[:id])
  if @message
    erb :"messages/show"
  else
    redirect "/messages"
  end
end

# EDIT
get "/messages/:id/edit" do
  @message = Message.find(params[:id])
  erb :"messages/edit"
end

# MESSAGES
delete "/messages/:id" do
  @message = Message.find(params[:id])
  @message.destroy

  redirect "/messages"
end

# UPDATE
put '/messages/:id' do
  @message = Message.find(params[:id])
  if @message.update(params[:message])
    redirect "/messages/#{@message.id}"
  else
    erb :"messages/show"
  end
end
