#get the login form
get '/login' do 
  @user = User.new
  erb :'sessions/new'
end

# handle the form
post '/login' do 
  # find the user by their email address
  user = User.find_by_email(params[:user][:email])
  # if there is a user, check their password is correct
  if user && user.authenticate(params[:user][:password])
    #log the user in (use " " if we use #{})
    session[:user_id] = user.id
    flash[:success] = "Welcome!"
    redirect "/"
  # otherwise render the login form again
  else
    flash[:danger] = "Username or password incorrect"
    redirect "/login"
  end
end

#destroy the session
get '/logout' do 
  session.clear
  redirect "/login"
end