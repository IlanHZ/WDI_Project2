# HOME
get '/' do
  redirect "/users"
end

get '/about' do
 erb :about
 end 

 get '/contact' do
 erb :contact
 end 