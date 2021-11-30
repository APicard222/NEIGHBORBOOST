require 'date'
date_start = Date.new()
date_end = date_start + 1

puts "Erasing the DB..."
Demand.destroy_all
Material.destroy_all
Message.destroy_all
User.destroy_all
Building.destroy_all
puts "DB erased!"

puts "Creating Building..."
building1 = Building.new(code: 'test_1', address: 'Renens')
building1.save!
puts "Building created!"

puts "Creating Users..."
user1 = User.new(user_name: 'NG', first_name: 'Boris', last_name: 'Paillard', email: 'b.p@gmail.com', password: '123456')
user1.building = building1
user1.save!
user2 = User.new(user_name: 'BP', first_name: 'Seb', last_name: 'Saunier', email: 's.s@gmail.com', password: '123456')
user2.building = building1
user2.save!
puts "Users created!"

puts "Creating Materials..."
material1 = Material.new(title: 'Hammer', description: 'Strong hammer')
material1.user = user1
material1.building = building1
material1.save!
material2 = Material.new(title: 'Planche pour repasser', description: 'Vos chemises seront parfaites')
material2.user = user1
material2.building = building1
material2.save!
material3 = Material.new(title: 'Appareil à Raclette', description: "Lhiver approche")
material3.user = user2
material3.building = building1
material3.save!
puts "Materials created!"

puts "Creating demands ..."
demand1 = Demand.new(title: 'Baby-sitting', description: 'Needed baby-sitter for friday evening', end_date: date_end, start_date: date_start, category: 'care')
demand1.responder_id = user1.id
demand1.requester_id = user2.id
demand1.building = building1
demand1.save!
demand2 = Demand.new(title: 'Promener Boushka', description: 'Trop occupé vendredi soir', end_date: date_end, start_date: date_start, category: 'Quick help')
demand2.responder_id = user2.id
demand2.requester_id = user1.id
demand2.building = building1
demand2.save!
puts "Demand created!"

puts "Creating Messages..."
message1 = Message.new(content: "Ceci est un message test")
message1.user = user1
message1.building = building1
message1.save!
message2 = Message.new(content: "Ceci est un message test de l'user 2")
message2.user = user2
message2.building = building1
message2.save!
puts "Messages created!"

puts "Finish ...!!!"
