
# INDEX
get '/users' do 
  @users = User.all
  erb :'users/index'
end

# NEW
get 'users/new' do
  @user = User.new
  erb :'users/new'
end

# CREATE
post '/' do 
  @user = User.new(params[:user])
  #if all good, show all the users
  if @user.save
    redirect "/users"
  #if there is an error redirect to do it again not just crash the whole programm (better user experience)
  else 
    erb :'users/new'
  end
end

# SHOW
get '/users/:id' do 
  @user = User.find(params[:id])
  if @user 
    erb :'user/show'
  else 
    redirect "/users"
  end
end

# EDIT

get "users/:id/edit" do 
  @user = User.find(params[:id])
  erb :'users/edit'
end

# UPDATE

put '/users/:id' do 
  @user = User.find(params[:id])
  if @user.update{params[:user]}
    redirect "/users/#{@user.id}"
  else
    erb :'users/show'
  end
end




