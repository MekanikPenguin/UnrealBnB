puts "Cleaning database..."
User.destroy_all
Offer.destroy_all
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
puts "Creating User..."
User.create(username: "JamesB", first_name: "James", last_name: "Bond", email: "james.bond@wanadoo.com", password: "azerty")
User.create(username: "JackL", first_name: "Jack", last_name: "London", email: "jack.london@free.com", password: "azerty")
User.create(username: "JohnL", first_name: "John", last_name: "Lennon", email: "john.lennon@gmail.com", password: "azerty")
User.create(username: "GerardP", first_name: "Gerard", last_name: "Pique", email: "gerard.pique@orange.com", password: "azerty")
User.create(username: "PierreN", first_name: "Pierre", last_name: "Niney", email: "pierre.niney@sfr.com", password: "azerty")

puts "Creating Offer..."
Offer.create(name: 'Poudlard', address: '4 Privet Drive, Little Whinging', image: 'https://www.carigami.fr/magazine/wp-content/uploads/2018/10/harry-potter-poudlard.jpg', price: 5000, description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user_id:1)
Offer.create(name: 'Chateau de Peach', address: 'Royaume Champignon', image: 'https://www.warlegend.net/wp-content/uploads/Super-Mario-Bros-Le-Film-–-bande-annonce-VF-Au-cinema-le-29-mars-2-4-screenshot-e1665138859494.jpg', price: 5500 , description: 'Peach est la princesse du Royaume Champignon, qui est constamment attaquée par Bowser.', user_id:2)
Offer.create(name: 'Donjon Rouge', address: 'Port-Real', image: 'https://braindamaged.fr/wp-content/uploads/2018/04/game-of-thrones-saison-8-le-donjon-rouge-apparait-sur-le-tournage-une-631x250.jpg', price:6000 , description:"Le Donjon Rouge est la puissante forteresse qui se dresse sur la colline d'Aegon à Port-Réal.", user_id:3)
Offer.create(name: 'Barad-dûr ', address: 'Mordor', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR0lzvcWUbYSvwMHasH6iSewaHJyHNwb8tYg&s', price:3000, description: "La tour principale mesure environ 1 400 mètres de hauteur et se trouve dans le nord du Mordor, au sommet d'une colline rocheuse", user_id:4)
Offer.create(name: 'Marais de Shrek', address: 'Highlands', image: 'https://5personnes.com/wp-content/uploads/2023/10/LE-AIRBNB-LE-PLUS-DEMANDE-AU-MONDE-4-59-screenshot.webp', price:100  , description: "Niché dans les collines des Highlands écossais, le Marais de Shrek est une oasis marécageuse, couverte de mousse et à l'eau trouble… mais surtout l'endroit idéal pour trouver la paix et la tranquillité !", user_id:5)
puts "Success Offer..."
