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
sauron = User.create(username: "SauronleBG", first_name: "Sauron", last_name: "Lord", email: "sauron.lord@ring.com", password: "azerty")
fiona = User.create(username: "Fifi1234", first_name: "Fiona", last_name: "Shrek", email: "fiona.shred@lane.com", password: "azerty")

puts "Création d'offres magiquement superbes..."
# offer = Offer.new(name: 'Poudlard', address: '4 Privet Drive, Little Whinging', price: 5000, description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user: rogue)
# offer.photo.attach(
#   io: URI.open('https://www.carigami.fr/magazine/wp-content/uploads/2018/10/harry-potter-poudlard.jpg'),
#   filename: "#{offer.name}.jpg",
#   content_type: 'image/jpg'
# )
# offer.save

Offer.create(name: 'Poudlard', address: 'Secret Place in Scotland', image: 'https://www.carigami.fr/magazine/wp-content/uploads/2018/10/harry-potter-poudlard.jpg', price: 100000 , description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user: rogue)
Offer.create(name: 'Chateau de Peach', address: 'Royaume Champignon', image: 'https://www.warlegend.net/wp-content/uploads/Super-Mario-Bros-Le-Film-–-bande-annonce-VF-Au-cinema-le-29-mars-2-4-screenshot-e1665138859494.jpg', price: 5500 , description: 'Peach est la princesse du Royaume Champignon, qui est constamment attaquée par Bowser.', user: mario)
Offer.create(name: 'Donjon Rouge', address: 'Port-Real', image: 'https://braindamaged.fr/wp-content/uploads/2018/04/game-of-thrones-saison-8-le-donjon-rouge-apparait-sur-le-tournage-une-631x250.jpg', price:6000 , description:"Le Donjon Rouge est la puissante forteresse qui se dresse sur la colline d'Aegon à Port-Réal.", user: tyrion)
Offer.create(name: 'Barad-dûr ', address: 'Mordor', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR0lzvcWUbYSvwMHasH6iSewaHJyHNwb8tYg&s', price:3000, description: "La tour principale mesure environ 1 400 mètres de hauteur et se trouve dans le nord du Mordor, au sommet d'une colline rocheuse", user: sauron)
Offer.create(name: 'Marais de Shrek', address: 'Highlands', image: 'https://5personnes.com/wp-content/uploads/2023/10/LE-AIRBNB-LE-PLUS-DEMANDE-AU-MONDE-4-59-screenshot.webp', price:100  , description: "Niché dans les collines des Highlands écossais, le Marais de Shrek est une oasis marécageuse, couverte de mousse et à l'eau trouble… mais surtout l'endroit idéal pour trouver la paix et la tranquillité !", user: fiona)

puts "Yahhoouuu!"
