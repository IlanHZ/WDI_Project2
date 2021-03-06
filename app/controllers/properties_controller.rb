# INDEX

get "/properties" do
  authorize!
  if params[:search] && !params[:search].empty?
    # Allows to use the search bar based on address, city, postcode
    @properties = Property.where("address1 ILIKE :search OR postcode ILIKE :search OR city ILIKE :search", { search: "%#{params[:search]}%" })
  else
    # if not filtered, just display all of them
    @properties = Property.all
  end 
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
  # the property has a one to one relation with the current user
  @property.user = current_user
  if @property.save
    redirect "/properties"
  else
    erb :"properties/new"
  end
end

# MAPS

get "/properties/map" do
  authorize!
  # display every property on the map
   @properties = Property.all
  erb :'properties/map'
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

