# HOME
get '/' do
  redirect "/users"
end

get '/about' do
 erb :'static/about'
end 

 # get '/contact' do
 # erb :contact
 # end 