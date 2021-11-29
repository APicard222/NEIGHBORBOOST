require 'date'
date_start = Date.new()
date_end = date_start + 1

puts "Erasing the DB..."
Demand.destroy_all
Material.destroy_all
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
puts "Creating Material..."
material1 = Material.new(title: 'Hammer', description: 'Strong hammer')
material1.user = user1
material1.building = building1
material1.save!
puts "Material created!"
puts "Creating demands ..."
demand1 = Demand.new(title: 'Baby-sitting', description: 'Needed baby-sitter for friday evening', end_date: date_end, start_date: date_start, category: 'care')
demand1.responder_id = user1.id
demand1.requester_id = user2.id
demand1.building = building1
demand1.save!
puts "Demand created!"
puts "Finish ...!!!"
