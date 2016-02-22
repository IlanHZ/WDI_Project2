# INDEX

get "/properties" do
  @properties = Property.all
  erb :"properties/index"
end

# NEW
get "/properties/new" do
  @property = Property.new
  erb :"properties/new"
end

# CREATE
post "/properties" do
  @property = Property.new(params[:property])
  if @property.save
    redirect "/properties"
  else
    erb :"properties/new"
  end
end

# SHOW
get "/properties/:id" do
  @property = Property.find(params[:id])
  if @property
    erb :"properties/show"
  else
    redirect "/properties"
  end
end

# EDIT
get "/properties/:id/edit" do
  @property = Property.find(params[:id])
  erb :"properties/edit"
end

# UPDATE
put '/properties/:id' do
  @property = Property.find(params[:id])
  if @property.update(params[:property])
    redirect "/properties/#{@property.id}"
  else
    erb :"properties/show"
  end
end