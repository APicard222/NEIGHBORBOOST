require 'date'
require "open-uri"
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
user1 = User.new(user_name: 'jacky2', first_name: 'Jack', last_name: 'Miller', email: 'b.p@gmail.com', password: '123456')
user1.building = building1
user1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638440857/user1_thsdku.jpg'),
  filename: "u1.png",
  content_type: 'image/png'
)
user1.save!
user2 = User.new(user_name: 'Stefano', first_name: 'Stefano', last_name: 'Fiorenzi', email: 's.s@gmail.com', password: '123456')
user2.building = building1
user2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638440857/user2_jye2qe.jpg'),
  filename: "u2.png",
  content_type: 'image/png'
)
user2.save!
user3 = User.new(user_name: 'Ed', first_name: 'Eddie', last_name: 'Smith', email: 'b.n@gmail.com', password: '123456')
user3.building = building1
user3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638440857/user3_f2kxhk.png'),
  filename: "u3.png",
  content_type: 'image/png'
)
user3.save!
puts "Users created!"

puts "Creating Materials..."
puts "Downloading images..."
puts "Image downloaded !"
material1 = Material.new(title: 'SUP de qualité', description: "J'ai reçu ce superbe Stand up Paddle pour mon anniversaire mais je m'en sers que très peu car trop lourd pour moi... Si vous voulez l'utiliser, laissez moi un petit message. Il est en parfait état.", available: true)
material1.user = user1
material1.building = building1
material1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/SUP_hihr2r.jpg'),
  filename: "m1.png",
  content_type: 'image/png'
)
puts "Passed ?"
material1.save!
material2 = Material.new(title: 'Boîte à Outil', description: "Salut les voisins! Je vous mets à disposition de l'entrepôt ma superbe boîte à outil qui n'arrête pas de me sauver la vie dans cet immeuble... Ce n'est pas le sujet. N'hésitez pas à la réserver c'est avec plaisir que je vous la prête contre une petite Bière 🍺 ", available: false)
material2.user = user1
material2.building = building1
material2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/boite%C3%A0outil_rofpy1.jpg'),
  filename: "m2.png",
  content_type: 'image/png'
)
material2.save!
material3 = Material.new(title: 'Appareil à Raclette', description: "Je mets à disposition mon appareil à raclette XXL pouvant acceuilir 8 convives simultanéments. C'est avec plaisir que je vous mets cet objet à disposition. La planête nous en sera que reconaissante.   ", available: true)
material3.user = user2
material3.building = building1
material3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638437915/raclettetime_cpcayf.jpg'),
  filename: "m3.png",
  content_type: 'image/png'
)
puts "A mon avis ça beuge... Après je dis ça je dis rien"
material3.save!
material4 = Material.new(title: 'Tandem bi-place', description: "Bonjour l'entrepôt. Je possède ce superbe tandem bi-place dont je me sers presque plus. Objet incluant une assistance éléctrique de plus de 70km, au combien suffisant pour se rendre compte qu'on est très proche de son compagnon... Amitiés, Franziska", available: false)
material4.user = user2
material4.building = building1
material4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/tandem_gtqgco.jpg'),
  filename: "m4.png",
  content_type: 'image/png'
)
material4.save!
material5 = Material.new(title: 'Jeux de 4 pneus Été', description: "Je viens d'emménager ici. Vivant auparavant en France je possédais une superbe 206. Elle n'a malheureusement pas passée le contrôle technique. Si jamais vous êtes intéressés par ce train de pneu, je vous l'offre volontiers. Mieux vaut donner que jeter.", available: true)
material5.user = user3
material5.building = building1
material5.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/pneus_rvaqxe.jpg'),
  filename: "m5.png",
  content_type: 'image/png'
)
material5.save!
material6 = Material.new(title: 'Echelle', description: "Bonjour à tous ! Ici Gérard, le voisin du 5ième. Je n'ai pas tout à fait compris le fonctionnement de ce nouveau outil... A vrai dire je préferais le papier. Mais voila, si quelqun à besoin d'une échelle, j'ai ce qu'il vous faut.", available: true)
material6.user = user3
material6.building = building1
material6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/%C3%A9chelle_av0eby.png'),
  filename: "m6.png",
  content_type: 'image/png'
)
material6.save!
material7 = Material.new(title: "Luge d'hiver en Bois", description: "Une Formule 1 de la neige. M'étant brisé une vertèbre en tombant de l'échelle de Gérard, je ne vais pas pouvoir utiliser mon bolide cet hiver. A votre disposition si besoin. Elle m'est cependant très chère car je possède le record des Diablerets 💨  ", available: true)
material7.user = user3
material7.building = building1
material7.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/luge_bkxkyw.jpg'),
  filename: "m7.png",
  content_type: 'image/png'
)
material7.save!
puts "Materials created!"

puts "Creating demands ..."
demand1 = Demand.new(title: 'Baby-sitting', description: 'Needed baby-sitter for friday evening', end_date: date_end, start_date: date_start, status: "confirmed")
demand1.responder_id = user1.id
demand1.requester_id = user2.id
demand1.building = building1
demand1.save!
demand2 = Demand.new(title: 'Promener Boushka', description: 'Trop occupé vendredi soir', end_date: date_end, start_date: date_start, status: 'posted')
demand2.requester_id = user1.id
demand2.building = building1
demand2.save!
demand3 = Demand.new(title: 'Cours de Maths pour ma fille (13 ans)', description: 'Ma fille est vraiment nulle en math, je désespère.', end_date: date_end, start_date: date_start, status: 'posted')
demand3.requester_id = user1.id
demand3.building = building1
demand3.save!
demand4 = Demand.new(title: 'Je fissure. Qui veut cuisiner pour moi cette semaine?', description: 'Je vous indémnise 9CHF par repas du soir', end_date: date_end, start_date: date_start, status: 'confirmed')
demand4.requester_id = user2.id
demand4.responder_id = user3.id
demand4.building = building1
demand4.save!
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
message3 = Message.new(content: "La forme ou quoi ? Qui est chaud pour un petit squash?")
message3.user = user2
message3.building = building1
message3.save!
message4 = Message.new(content: "Tu peux créer une demande pour cette question si tu veux aussi...")
message4.user = user1
message4.building = building1
message4.save!
puts "Messages created!"

puts "Finish ...!!!"
