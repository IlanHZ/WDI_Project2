require_relative "/models/user.rb"

#empty all the entries
User.destroy_all

[
  {
    username: "IlanHZ",
    first_name: "Ilan",
    last_name: "Hazan",
    email: "ilaneliehazan@gmail.com",
    genre: "M",
    age: "73",
    image: "",
    password_digest:"ilanilan"

  }
].each do |user|
  User.create!(user)
end




