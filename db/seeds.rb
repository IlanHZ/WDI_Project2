require_relative "../models/message.rb"
# require_relative "../models/property.rb"
# require_relative "../models/user.rb"

#empty all the entries
User.destroy_all

[
  {
    username: "IlanHZ",
    first_name: "Ilan",
    last_name: "Hazan",
    email: "ilaneliehazan@gmail.com",
    gender: "male",
    age: 77,
    password_digest: "password",
    comment: "I am looking for someone to share my flat"
  }
].each do |user|
  User.create!(user)
end



