User.destroy_all

puts "Starting seeding"

puts "Seeding users"
User.create!(username: "smh1988", password:"123", first_name: "Sean", last_name: "Hurley")
User.create!(username: "pfeytser", password:"123", first_name: "Peter", last_name: "Feytser")
puts "Finished seeding users"

puts "Finished seeding"