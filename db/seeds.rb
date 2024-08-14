require 'open-uri'

puts "Cleaning database..."
Offer.destroy_all
User.destroy_all
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   end
puts "Création d'individus légendaires..."
rogue = User.create(username: "harryptitcon", first_name: "Rogue", last_name: "Master", email: "rogue.master@lilly.com", password: "azerty")
mario = User.create(username: "Yahouuuu", first_name: "Mario", last_name: "Bros", email: "mario.bros@yahouuu.com", password: "azerty")
tyrion = User.create(username: "beaugosse", first_name: "Tyrion", last_name: "Lannister", email: "ialwayspay@mydebts.com", password: "azerty")
frodon = User.create(username: "FrodonleBG", first_name: "Frodon", last_name: "Saquet", email: "frodon.saquet@comte.com", password: "azerty")
fiona = User.create(username: "Fifi1234", first_name: "Fiona", last_name: "Shrek", email: "fiona.shred@lane.com", password: "azerty")
luke = User.create(username: "lukethebest", first_name: "Luke", last_name: "Skywalker", email: "luke.sky@dark.com", password: "azerty")
thor = User.create(username: "thorthebest", first_name: "Thor", last_name: "Le Dieu", email: "thor.ledieu@genius.com", password: "azerty")
geralt = User.create(username: "Yen1234", first_name: "Geralt", last_name: "De Riv", email: "geralt.deriv@witcher.com", password: "azerty")
User.create(username: "RingLover", first_name: "Sauron", last_name: "Du Mordor", email: "sauron@wanadoo.fr", password: "azerty")

puts "Création d'offres magiquement superbes..."
# offer = Offer.new(name: 'Poudlard', address: '4 Privet Drive, Little Whinging', price: 5000, description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user: rogue)
# offer.photo.attach(
#   io: URI.open('https://www.carigami.fr/magazine/wp-content/uploads/2018/10/harry-potter-poudlard.jpg'),
#   filename: "#{offer.name}.jpg",
#   content_type: 'image/jpg'
# )
# offer.save

Offer.create(name: 'Poudlard', address: 'Alnwick NE66 1NQ, United Kingdom', url_image: 'https://miro.medium.com/v2/resize:fit:1200/1*g7nlreAAvIeBMGjS9jsRWQ.jpeg', price: 100000 , description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user: rogue)
sleep(4)
Offer.create(name: 'Chateau de Peach', address: '10 Rockefeller Plaza, New York, New York, 10020', url_image: 'https://nintendoeverything.com/wp-content/uploads/Mario-Bros-Movie-Mushroom-Kingdom.jpg', price: 5500 , description: 'Peach est la princesse du Royaume Champignon, qui est constamment attaquée par Bowser.', user: mario)
sleep(4)
Offer.create(name: 'Donjon Rouge', address: 'Stradun 33, 20000, Dubrovnik, Croatia', url_image: 'https://cdnb.artstation.com/p/assets/images/images/012/370/613/large/steve-lund-castle-color2.jpg?1534439770', price:6000 , description:"Le Donjon Rouge est la puissante forteresse qui se dresse sur la colline d'Aegon à Port-Réal.", user: tyrion)
sleep(4)
Offer.create(name: 'Cul-de-Sac', address: '1 Bagshot Row, Matamata 3472, New Zealand', url_image: 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2020/12/shire-unreal-engine-4-hobbit-hole-side-view.jpg', price:3000, description: "Ce petit trou localisé au coeur de la Comté, est la résidence de la famille Saquet, Bilbon et Frodon étant les plus connus.", user: frodon)
sleep(4)
Offer.create(name: 'Marais de Shrek', address: '30 Rissington Rd, Cheltenham GL54 2AY, United Kingdom', url_image: 'https://i.redd.it/a0eke43vh7a71.jpg', price:100  , description: "Niché dans les collines des Highlands écossais, le Marais de Shrek est une oasis marécageuse, couverte de mousse et à l'eau trouble… mais surtout l'endroit idéal pour trouver la paix et la tranquillité !", user: fiona)
sleep(4)
Offer.create(name: 'Palais de Jabba', address: 'P93, Tataouine, Tunisia', url_image: 'https://lumiere-a.akamaihd.net/v1/images/image_b3e570b3.jpeg?region=0,64,2413,965', price:20000  , description: "Une forteresse idéale pour malfrats et mafieux souhaitant faire de gros buffets et voir des esclaves danser", user: luke)
sleep(4)
Offer.create(name: 'Asgard', address: 'Havnegata 20, 3179 Åsgårdstrand, Norway', url_image: 'https://miro.medium.com/v2/resize:fit:1400/1*imyiyFPSFuWhI0952bLLPA.png', price:100000  , description: "Royaume paradiasque où vous pourrez vous prélasser éternellement avec dieux et deesses, et ce en compagnie du plus fort des avengers..!", user: thor)
sleep(4)
Offer.create(name: 'Novigrad', address: '52466, Novigrad, Croatia', url_image: 'https://i.redd.it/bfydnw47tf9a1.png', price:1000  , description: "Capital de Velen, où bars à plaisirs et marchands ambulants sont nombres. Engagez aussi des witchers à l'occasion.", user: geralt)

puts "Yahhoouuu!"
