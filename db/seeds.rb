require 'date'
require "open-uri"
date = Date.today

puts "Erasing the DB..."
Demand.destroy_all
Material.destroy_all
Message.destroy_all
User.destroy_all
Building.destroy_all
puts "DB erased!"

puts "Creating Building..."
building1 = Building.new(code: 'bienvenue', address: 'Renens', name: "Les Acacias")
building1.save!
puts "Building created!"

puts "Creating Users..."
user1 = User.new(user_name: 'emma_2', first_name: 'Emma', last_name: 'Miller', email: 'emma.m@gmail.com', password: '123456')
user1.building = building1
user1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638440857/user1_thsdku.jpg'),
  filename: "u1.png",
  content_type: 'image/png'
)
user1.save!
user2 = User.new(user_name: 'stefano', first_name: 'Stefano', last_name: 'Fiorenzi', email: 'stefano.f@gmail.com', password: '123456')
user2.building = building1
user2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639122156/stefano_y4ffga.jpg'),
  filename: "u2.png",
  content_type: 'image/png'
)
user2.save!
puts "No worries, already 2 users created..."
user3 = User.new(user_name: 'Ed_smith', first_name: 'Eddie', last_name: 'Smith', email: 'eddie.smith@gmail.com', password: '123456')
user3.building = building1
user3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639122513/eddie_bfuocp.jpg'),
  filename: "u3.png",
  content_type: 'image/png'
)
user3.save!
user4 = User.new(user_name: 'Paloma_D', first_name: 'Paloma', last_name: 'Duchampt', email: 'p.d@gmail.com', password: '123456')
user4.building = building1
user4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638525216/user_4_za2bua.jpg'),
  filename: "u4.png",
  content_type: 'image/png'
)
user4.save!
user5 = User.new(user_name: 'Giselle', first_name: 'Giselle', last_name: 'Martin', email: 'giselle.m@gmail.com', password: '123456')
user5.building = building1
user5.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639122157/touriste_user_j7djzk.jpg'),
  filename: "u5.png",
  content_type: 'image/png'
)
user5.save!
user6 = User.new(user_name: 'Fabio', first_name: 'Fabio', last_name: 'Dupasquier', email: 'fabio.d@gmail.com', password: '123456')
user6.building = building1
user6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639122805/fabio_doxdqg.jpg'),
  filename: "u6.png",
  content_type: 'image/png'
)
user6.save!
user7 = User.new(user_name: 'pierro', first_name: 'Pierre', last_name: 'Desgranges', email: 'pierre.d@gmail.com', password: '123456')
user7.building = building1
user7.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639123048/user_7_jmffjn.jpg'),
  filename: "u7.png",
  content_type: 'image/png'
)
user7.save!

puts "--------------------------------------------------"
puts "-----------------Users created!-------------------"
puts "--------------------------------------------------"

puts "Creating Materials..."
puts "Downloading images..."

material1_1 = Material.new(title: 'Raquettes à neige', description: "Hello les voisins. J'aimerais mettre à disposition de l'entrepôt mes superbes raquettes à neige afin que vous puissiez profiter pleinement des belles journées hivernales qui nous attendent. Elle sont compatibles pour les pointures allant du 36 au 43. N'hésitez pas! Evadez vous !")
material1_1.user = user1
material1_1.building = building1
material1_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638526039/raquettes_ghk3oz.jpg'),
  filename: "m1_1.png",
  content_type: 'image/png'
)
material1_1.save!
material1_2 = Material.new(title: 'Sun Tzu', description: "Hello les voisins. J'aimerais vous mettre à disposition ce mon Sun Tzu. Ce jeu d'origine chinoise est l'élément indispensable pour passer des moments inoubliables entre amis ou en famille. Il faut faire preuve de tactique, d'interpretation et de malice pour performer de la meilleure des façons. Je peux vous expliquer les règles avec plaisir.")
material1_2.user = user1
material1_2.building = building1
material1_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639123529/SunTzu_zpwghb.jpg'),
  filename: "m1_2.png",
  content_type: 'image/png'
)
material1_2.save!

puts "------------Materials User 1 created-------------------"

material2_1 = Material.new(title: 'Jeux de 4 pneus Été', description: "Ciao les copains ! Je viens d'arriver depuis Torino en Italie où je possédais une superbe fiat Punto. Elle n'a malheureusement pas passée le contrôle technique. Si jamais vous êtes intéressés par ce train de pneu, je vous l'offre volontiers. Mieux vaut donner que jeter. Bonne journée à tous !")
material2_1.user = user2
material2_1.building = building1
material2_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/pneus_rvaqxe.jpg'),
  filename: "m2_1.png",
  content_type: 'image/png'
)
material2_1.save!

material2_2 = Material.new(title: 'Four à Pizza 🍕', description: "Ciao les copains ! J'ai ramené de Torino ce Four à Pizza. Il est magique. Tu peux faire des Pizzas incroyables avec et il est très simple pour l'utiliser. Tu invites tes amis, tu me demandes le four à Pizza, tu sors le Campari, et tout va bien se passer c'est sûr. Viva Italia, viva la Pizza!")
material2_2.user = user2
material2_2.building = building1
material2_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639124614/four_pizza_tgi0nl.jpg'),
  filename: "m2_2.png",
  content_type: 'image/png'
)
material2_2.save!

puts "-----------Materials User 2 created----------------------"

material3_1 = Material.new(title: 'Boîte à Outil', description: "Salut les voisins! Je vous mets à disposition de l'entrepôt ma superbe boîte à outil qui n'arrête pas de me sauver la vie dans cet immeuble... Ce n'est pas le sujet. N'hésitez pas à la réserver c'est avec plaisir que je vous la prête contre une petite Bière 🍺 ", start_time: date + 5, end_time: date + 7)
material3_1.user = user2
material3_1.building = building1
material3_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/boite%C3%A0outil_rofpy1.jpg'),
  filename: "m3_1.png",
  content_type: 'image/png'
)
material3_1.save!

material2_2 = Material.new(title: 'Boîte à Outil', description: "Salut les voisins! Je vous mets à disposition de l'entrepôt ma superbe boîte à outil qui n'arrête pas de me sauver la vie dans cet immeuble... Ce n'est pas le sujet. N'hésitez pas à la réserver c'est avec plaisir que je vous la prête contre une petite Bière 🍺 ", start_time: date + 5, end_time: date + 7)
material2_2.user = user2
material2_2.building = building1
material2_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/boite%C3%A0outil_rofpy1.jpg'),
  filename: "m2_2.png",
  content_type: 'image/png'
)
material2_2.save!
material3 = Material.new(title: 'Appareil à Raclette', description: "Je mets à disposition mon appareil à raclette XXL pouvant acceuilir 8 convives simultanéments. C'est avec plaisir que je vous mets cet objet à disposition. La planête nous en sera que reconaissante.   ", start_time: date + 12, end_time: date + 12)
material3.user = user2
material3.building = building1
material3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638437915/raclettetime_cpcayf.jpg'),
  filename: "m3.png",
  content_type: 'image/png'
)
puts "A mon avis ça beuge... Après je dis ça je dis rien"
material3.save!
material4 = Material.new(title: 'Tandem bi-place', description: "Bonjour l'entrepôt. Je possède ce superbe tandem bi-place dont je me sers presque plus. Objet incluant une assistance éléctrique de plus de 70km, au combien suffisant pour se rendre compte qu'on est très proche de son compagnon... Amitiés, Franziska")
material4.user = user2
material4.building = building1
material4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/tandem_gtqgco.jpg'),
  filename: "m4.png",
  content_type: 'image/png'
)
material4.save!
material6 = Material.new(title: 'Echelle', description: "Bonjour à tous ! Ici Gérard, le voisin du 5ième. Je n'ai pas tout à fait compris le fonctionnement de ce nouveau outil... A vrai dire je préferais le papier. Mais voila, si quelqun à besoin d'une échelle, j'ai ce qu'il vous faut.", start_time: date - 2, end_time: date)
material6.user = user3
material6.building = building1
material6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/%C3%A9chelle_av0eby.png'),
  filename: "m6.png",
  content_type: 'image/png'
)
material6.save!
material7 = Material.new(title: "Luge d'hiver en Bois", description: "Une Formule 1 de la neige. M'étant brisé une vertèbre en tombant de l'échelle de Gérard, je ne vais pas pouvoir utiliser mon bolide cet hiver. A votre disposition si besoin. Elle m'est cependant très chère car je possède le record des Diablerets 💨  ", start_time: date + 13, end_time: date + 14)
material7.user = user3
material7.building = building1
material7.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/luge_bkxkyw.jpg'),
  filename: "m7.png",
  content_type: 'image/png'
)
material7.save!
puts "Warehouse is filling up nicely :))"
material8 = Material.new(title: "Raquettes à neige", description: "Hello les voisins. J'aimerais mettre à disposition de l'entrepôt mes superbes raquettes à neige afin que vous puissiez profiter pleinement des belles journées hivernales qui nous attendent. Elle sont compatibles pour les pointures allant du 36 au 43. N'hésitez pas! Evadez vous !")
material8.user = user4
material8.building = building1
material8.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638526039/raquettes_ghk3oz.jpg'),
  filename: "m8.png",
  content_type: 'image/png'
)
material8.save!
material9 = Material.new(title: "Filet de Volley extérieur", description: "Avant que je n'oublie. J'aimerais aussi vous faire profiter de ce filet de Volley extérieur. Il est très léger et simple à l'utilisation. Le ballon n'est cependant pas fourni. Idéal pour les journées d'été. On peut l'insatller n'importe ou et les parties sont très amusantes.")
material9.user = user4
material9.building = building1
material9.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638526040/filet_de_volley_jgsxlp.jpg'),
  filename: "m9.png",
  content_type: 'image/png'
)
material9.save!
puts "Materials created!"

puts "Creating Bookings"
booking1 = Booking.new(start_time: date, end_time: date + 3)
booking1.booker = user1
booking1.material = material1
booking1.save!
booking2 = Booking.new(start_time: date - 1, end_time: date)
booking2.booker = user1
booking2.material = material2
booking2.save!
booking3 = Booking.new(start_time: date + 3, end_time: date + 7)
booking3.booker = user4
booking3.material = material5
booking3.save!
puts "Booking Created"

puts "Creating demands ..."
demand1 = Demand.new(title: 'Baby-sitting de Noé Samedi soir', description: 'Nous avons une soirée au Bristol samedi soir, et aimerions déléguer la garde de notre enfant (5ans). Nourriture + indémnisation prévue', end_date: date + 1, start_date: date + 1, status: "confirmed")
demand1.responder_id = user2.id
demand1.requester_id = user1.id
demand1.building = building1
demand1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638527419/babysitting_ujau1x.jpg'),
  filename: "d1.png",
  content_type: 'image/png'
)
demand1.save!
demand2 = Demand.new(title: "S'occuper de Boushka vendredi soir ", description: "Ayant prévue de sortir ce vendredi soir, je cherche un voisin pour garder mon chien pendant cette nuit là. Cookies à la clé 🍪", end_date: date, start_date: date, status: 'posted')
demand2.requester_id = user4.id
demand2.building = building1
demand2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638527419/promenade_chien_mdvlku.png'),
  filename: "d2.png",
  content_type: 'image/png'
)
demand2.save!
demand3 = Demand.new(title: 'Cours de Maths pour ma fille (13 ans)', description: "Ma fille est vraiment nulle en math, comme ses parentes d'ailleurs... L'idée serait de trouver un répétiteur tous les vendredis soirs", end_date: date + 2, start_date: date + 2, status: 'posted')
demand3.requester_id = user2.id
demand3.building = building1
demand3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638527419/coursmath_srzroq.jpg'),
  filename: "d3.png",
  content_type: 'image/png'
)
demand3.save!
demand4 = Demand.new(title: 'Qui veut cuisiner pour moi cette semaine?', description: "Je fissure... Je n'ai plus la motivation de cuisiner et je manges des Pizza sodebo tous les soirs. Si une âme charitable voudrait bien m'aider, je propose d'indémniser 9CHF par repas du soir.", end_date: date + 7, start_date: date + 2, status: 'posted')
demand4.requester_id = user3.id
demand4.building = building1
demand4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638527419/cuisine_ygsuh0.jpg'),
  filename: "d4.png",
  content_type: 'image/png'
)
demand4.save!
puts "Demand created!"

puts "Creating Messages..."
message1 = Message.new(content: "Vraiment top cette appli. Je me réjouis d'apprendre à vous connaître :)")
message1.user = user1
message1.building = building1
message1.save!
message2 = Message.new(content: "En effet Jaques, j'ai rempli l'entrepôt avec les objets dont je n'avais plus besoin. N'hésitez pas à aller y jeter un coup d'oeil.")
message2.user = user2
message2.building = building1
message2.save!
message3 = Message.new(content: "Idem, j'y ai ajouté des choses aussi. Mes pneus d'été sont toujours disponible d'ailleurs.")
message3.user = user3
message3.building = building1
message3.save!
message4 = Message.new(content: "Mon c'est Jack, pas Jaques... Ton appareil à Raclette, super idée. J'ai noté 🫕")
message4.user = user1
message4.building = building1
message4.save!
message5 = Message.new(content: "Hello les voisins, vous avez de l'eau chaude encore ? ")
message5.user = user4
message5.building = building1
message5.save!
message6 = Message.new(content: "Je suis dans le Sud cette semaine, je ne peux pas vous aider. Toutes mes excuses... ")
message6.user = user2
message6.building = building1
message6.save!
puts "Messages created!"

puts "Finish ...!!!"
