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

material3_1 = Material.new(title: 'Ecran Ultra Large', description: "Bonjour à tous! Les temps sont durs actuellement avec tout ce Home Office et ce Covid de partout. J'ai reçu de mon employeur des nouveaux écrans d'ordis et je n'utilise plus les anciens. Si vous en avez besoin, réservez mon ancien écran pour l'utiliser pour ces prochains mois. Cela rend le travail à la maison bien plus agréable.")
material3_1.user = user3
material3_1.building = building1
material3_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639125065/%C3%A9cran_dordi_yhqcyq.jpg'),
  filename: "m3_1.png",
  content_type: 'image/png'
)
material3_1.save!

material3_2 = Material.new(title: 'Skate Electrique 400W', description: "Bonjour les voisins. J'ai ramené cette merveille technologique de mon séjour aux Etats Unis l'année dernière. C'est la Rolls Royce des planches à roulettes électrique. La puissance est folle et l'autonmie autour des 40km. Si il y a des amateurs de sensations fortes je vous conseille d'essayer cet engin. Vous n'allez pas être déçu. 💨💨💨 ")
material3_2.user = user3
material3_2.building = building1
material3_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639132437/boosted_jiu21n.jpg'),
  filename: "m3_2.png",
  content_type: 'image/png'
)
material3_2.save!

puts "----------User 3 Materials created-----------------"

material4_1 = Material.new(title: 'Table et Jeu de Majong', description: "Hello les voisins. Ayant vu le jeu que Emma a proposé, je me suis rappelée que j'avais dans ma cave une table de Majong avec le Jeu. C'est un jeu chinois qui a traversé les millénaires et qui se joue exclusivement à 4 personnes. Une partie entre amis est toujours une bonne idée.")
material4_1.user = user4
material4_1.building = building1
material4_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639127252/majong_xi1iol.jpg'),
  filename: "m4_1.png",
  content_type: 'image/png'
)
material4_1.save!

material4_2 = Material.new(title: 'Caquelon à fondue', description: "Je mets à disposition mon caquelon à fondue pouvant acceuilir 6 convives simultanéments. La saison arrive donc une bonne fondue moitié moitié passera nikel. C'est avec plaisir que je vous mets cet objet à disposition. La planête nous en sera que reconaissante. ")
material4_2.user = user4
material4_2.building = building1
material4_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639127753/fondue_ia7dgh.jpg'),
  filename: "m4_2.png",
  content_type: 'image/png'
)
material4_2.save!

puts "----------User 4 Materials created------------------------"

material5_1 = Material.new(title: 'Tandem bi-place', description: "Bonjour l'entrepôt. Je possède ce superbe tandem bi-place dont je me sers presque plus. Objet incluant une assistance éléctrique de plus de 70km, au combien suffisant pour se rendre compte qu'on est très proche de son compagnon... Amitiés, Giselle")
material5_1.user = user5
material5_1.building = building1
material5_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/tandem_gtqgco.jpg'),
  filename: "m5_1.png",
  content_type: 'image/png'
)
material5_1.save!

material5_2 = Material.new(title: 'Appareil à Crêpes', description: "Bonjour à tous. Si une envie pressante de crêpes vous prends, vous êtes au bon endroit. Appareil très simple d'utilisation. Une fois lancée la cadence est forte. Idéal pour un anniversaire ou une bonne soirée crêpe. Je vous souhaite une bonne journée.")
material5_2.user = user5
material5_2.building = building1
material5_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639128303/cr%C3%AApes_nbqvux.jpg'),
  filename: "m5_2.png",
  content_type: 'image/png'
)
material5_2.save!

puts "------------User 5 Materials created-------------------"

material7_1 = Material.new(title: 'Boîte à Outil', description: "Salut les voisins! Je vous mets à disposition de l'entrepôt ma superbe boîte à outil qui n'arrête pas de me sauver la vie dans cet immeuble... Ce n'est pas le sujet. N'hésitez pas à la réserver c'est avec plaisir que je vous la prête contre une petite Bière 🍺 ")
material7_1.user = user7
material7_1.building = building1
material7_1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/boite%C3%A0outil_rofpy1.jpg'),
  filename: "m7_1.png",
  content_type: 'image/png'
)
material7_1.save!

material7_2 = Material.new(title: 'Echelle', description: "Bonjour à tous ! Ici Pierre, le voisin du 5ième. Je n'ai pas tout à fait compris le fonctionnement de ce nouveau outil... A vrai dire je préferais le papier. Mais voila, si quelqun à besoin d'une échelle, j'ai ce qu'il vous faut.")
material7_2.user = user7
material7_2.building = building1
material7_2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/%C3%A9chelle_av0eby.png'),
  filename: "m7_2.png",
  content_type: 'image/png'
)
material7_2.save!

material7_3 = Material.new(title: 'Visseuse - Perceuse éléctrique', description: "Bonjour à tous ! Voici ma visseuse - perceuse éléctrique. Parfaite pour monter des meubles à la vitesse de l'éclair, ou pour percer vos murs pour y accrocher des choses. Je peux même vous aider pour le bricolage si vous en avez besoin.")
material7_3.user = user7
material7_3.building = building1
material7_3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639128771/visseuse_bcmda8.jpg'),
  filename: "m7_3.png",
  content_type: 'image/png'
)
material7_3.save!

puts "------------User 7 materials created!---------------------"

material6 = Material.new(title: "Luge d'hiver en Bois", description: "Une Formule 1 de la neige. M'étant brisé une vertèbre en tombant de l'échelle de Gérard, je ne vais pas pouvoir utiliser mon bolide cet hiver. A votre disposition si besoin. Elle m'est cependant très chère car je possède le record des Diablerets 💨  ", start_time: date + 13, end_time: date + 14)
material6.user = user6
material6.building = building1
material6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1638438599/luge_bkxkyw.jpg'),
  filename: "m6.png",
  content_type: 'image/png'
)
material6.save!

puts "-------------------------------------------------------------"
puts "------------------Materials created!-------------------------"
puts "-------------------------------------------------------------"

puts "Creating Bookings"
booking1 = Booking.new(start_time: date + 1, end_time: date + 2)
booking1.booker = user3
booking1.material = material1_1
booking1.save!

booking2 = Booking.new(start_time: date + 8, end_time: date + 9)
booking2.booker = user5
booking2.material = material1_1
booking2.save!

booking2b = Booking.new(start_time: date - 1, end_time: date + 1)
booking2b.booker = user4
booking2b.material = material1_1
booking2b.save!

booking3 = Booking.new(start_time: date + 3, end_time: date + 10)
booking3.booker = user5
booking3.material = material2_1
booking3.save!

booking4 = Booking.new(start_time: date - 1, end_time: date + 2)
booking4.booker = user7
booking4.material = material2_2
booking4.save!

booking5 = Booking.new(start_time: date + 11, end_time: date + 15)
booking5.booker = user7
booking5.material = material2_2
booking5.save!

booking6 = Booking.new(start_time: date + 5, end_time: date + 5)
booking6.booker = user1
booking6.material = material2_2
booking6.save!

booking7 = Booking.new(start_time: date + 15, end_time: date + 35)
booking7.booker = user1
booking7.material = material3_1
booking7.save!

booking8 = Booking.new(start_time: date + 5, end_time: date + 8)
booking8.booker = user6
booking8.material = material4_1
booking8.save!

booking9 = Booking.new(start_time: date + 8, end_time: date + 9)
booking9.booker = user7
booking9.material = material4_2
booking9.save!

booking9b = Booking.new(start_time: date - 2, end_time: date + 1)
booking9b.booker = user5
booking9b.material = material4_2
booking9b.save!

booking10 = Booking.new(start_time: date + 5, end_time: date + 7)
booking10.booker = user4
booking10.material = material5_2
booking10.save!

booking11 = Booking.new(start_time: date + 3, end_time: date + 3)
booking11.booker = user5
booking11.material = material7_1
booking11.save!

booking12 = Booking.new(start_time: date + 2, end_time: date + 3)
booking12.booker = user1
booking12.material = material7_3
booking12.save!

booking13 = Booking.new(start_time: date + 8, end_time: date + 10)
booking13.booker = user2
booking13.material = material7_3
booking13.save!

booking14 = Booking.new(start_time: date + 6, end_time: date + 6)
booking14.booker = user4
booking14.material = material7_3
booking14.save!

puts "--------------------------------------------------"
puts "----------------Booking Created-------------------"
puts "--------------------------------------------------"

puts "Creating demands ..."
demand1 = Demand.new(title: 'Baby-sitting de Noé Samedi soir', description: 'Nous avons une soirée au Bristol samedi soir, et aimerions déléguer la garde de notre enfant (5ans). Nourriture + indémnisation prévue', end_date: date + 1, start_date: date + 1, status: "posted")
# demand1.responder_id = user2.id
demand1.requester_id = user1.id
demand1.building = building1
demand1.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639130285/no%C3%A9_bpxtqu.jpg'),
  filename: "d1.png",
  content_type: 'image/png'
)
demand1.save!

demand2 = Demand.new(title: "S'occuper de Boushka vendredi soir ", description: "Ayant prévue de sortir ce vendredi soir, je cherche un voisin pour garder mon chien pendant cette nuit là. Cookies à la clé 🍪", end_date: date, start_date: date, status: 'confirmed')
demand2.requester_id = user4.id
demand2.responder_id = user6.id
demand2.building = building1
demand2.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639130464/carlin_mnb3bg.jpg'),
  filename: "d2.png",
  content_type: 'image/png'
)
demand2.save!

demand3 = Demand.new(title: 'Cours de Maths pour Matthieu (13 ans)', description: "Matthieu rencontre des difficultés lors des cours de mathématiques. Il faut absolument que sa moyenne augmente. Recherche répétiteur tous les vendredis soirs", end_date: date + 7, start_date: date + 7, status: 'posted')
demand3.requester_id = user5.id
demand3.building = building1
demand3.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639130769/mathcours_uampat.jpg'),
  filename: "d3.png",
  content_type: 'image/png'
)
demand3.save!

demand4 = Demand.new(title: 'Qui veut cuisiner pour moi cette semaine?', description: "Je fissure... Je n'ai plus la motivation de cuisiner et je manges des Pizza sodebo tous les soirs. Si une âme charitable voudrait bien m'aider, je propose d'indémniser 9CHF par repas du soir.", end_date: date + 7, start_date: date + 2, status: 'posted')
demand4.requester_id = user3.id
demand4.building = building1
demand4.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639130552/chefdomicile_zisqmw.jpg'),
  filename: "d4.png",
  content_type: 'image/png'
)
demand4.save!

demand5 = Demand.new(title: 'Cherche chauffeur pour Aéroport', description: "Bonjour à tous, je me suis fait retirer mon permis la semaine dernière. Ma grand mère vient me rendre visite la semaine prochaine. Je chercherais un chaffeur pour lundi matin 10.00.", end_date: date + 3, start_date: date + 3, status: 'posted')
demand5.requester_id = user6.id
demand5.building = building1
demand5.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639131380/chauffeur_nhfaqr.jpg'),
  filename: "d5.png",
  content_type: 'image/png'
)
demand5.save!

demand6 = Demand.new(title: "Montage d'une armoire IKEA ", description: "Bonjour à tous, j'ai acheté un armoire chez IKEA cette semaine. Elle va être livrée mardi prochain. Si un de vous est motivé pour la monter, je vous indémniserait à la hauteur de 100 CHF", end_date: date + 4, start_date: date + 4, status: 'confirmed')
demand6.requester_id = user4.id
demand6.responder_id = user7.id
demand6.building = building1
demand6.photo.attach(
  io: URI.open('https://res.cloudinary.com/dvzoubga6/image/upload/v1639131513/armoire_q10qeg.jpg'),
  filename: "d6.png",
  content_type: 'image/png'
)
demand6.save!

puts "--------------------------------------------------"
puts "----------------Demand created!-------------------"
puts "--------------------------------------------------"

puts "Creating Messages..."
message1 = Message.new(content: "Vraiment top cette appli. Je me réjouis d'apprendre à vous connaître :)")
message1.user = user1
message1.building = building1
message1.save!
message2 = Message.new(content: "En effet! J'ai rempli l'entrepôt avec les objets dont je n'avais plus besoin. N'hésitez pas à aller y jeter un coup d'oeil.")
message2.user = user4
message2.building = building1
message2.save!
message3 = Message.new(content: "Idem, j'y ai ajouté des choses aussi. Mes pneus d'été sont toujours disponible d'ailleurs.")
message3.user = user2
message3.building = building1
message3.save!
message4 = Message.new(content: "Sont-ils compatibles avec une 206 ?")
message4.user = user7
message4.building = building1
message4.save!
message5 = Message.new(content: "Viens les voir chez moi quand tu peux. On regardera ça.")
message5.user = user2
message5.building = building1
message5.save!
message6 = Message.new(content: "Je suis à la recherche d'un éléctricien, connaissez vous une personne de confiance ?")
message6.user = user6
message6.building = building1
message6.save!
message7 = Message.new(content: "Oui ! mon pote Ricardo est un super type. Voici son numéro: 079 765 47 85")
message7.user = user7
message7.building = building1
message7.save!
message8 = Message.new(content: "Super. Merci beaucoup pour la réactivité.")
message8.user = user6
message8.building = building1
message8.save!
message9 = Message.new(content: "Veuillez s'il vous plaît prévenir la prochaine fois qu'une fête est prévue...")
message9.user = user5
message9.building = building1
message9.save!
message10 = Message.new(content: "Veuillez m'excuser pour hier soir. Je ferais en sorte de vous prévenir la prochaine fois")
message10.user = user1
message10.building = building1
message10.save!

puts "-------------------------------------------------------------"
puts "--------------------Messages created!------------------------"
puts "-------------------------------------------------------------"

puts "-------------------------------------------------------------"
puts "-------------------Seed up and Running-----------------------"
puts "-------------------------------------------------------------"
