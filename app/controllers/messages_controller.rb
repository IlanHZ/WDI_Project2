# INDEX

get "/messages" do
  @messages = Message.all
  erb :"messages/index"
end

# NEW
get "/messages/new" do
  @message = Message.new
  erb :"messages/new"
end

# CREATE
post "/messages" do
  @message = Message.new(params[:message])
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

# UPDATE
put '/messages/:id' do
  @message = Message.find(params[:id])
  if @message.update(params[:message])
    redirect "/messages/#{@message.id}"
  else
    erb :"messages/show"
  end
end
