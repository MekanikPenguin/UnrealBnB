require 'open-uri'

puts "Cleaning database..."
Offer.destroy_all
User.destroy_all

puts "Création d'individus légendaires..."

rogue = User.create(username: "harryptitcon", first_name: "Rogue", last_name: "Master", email: "rogue.master@lilly.com", password: "azerty", url_image: "data:image/jpeg;base64,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")
mario = User.create(username: "Yahouuuu", first_name: "Mario", last_name: "Bros", email: "mario.bros@yahouuu.com", password: "azerty", url_image: "https://freepngtransparent.com/wp-content/uploads/2023/03/mario-png-136.png")
tyrion = User.create(username: "beaugosse", first_name: "Tyrion", last_name: "Lannister", email: "ialwayspay@mydebts.com", password: "azerty", url_image: "https://img.over-blog.com/300x210/0/51/43/56/Septembre2014/tyrion-lannister.png")
frodon = User.create(username: "FrodonleBG", first_name: "Frodon", last_name: "Saquet", email: "frodon.saquet@comte.com", password: "azerty", url_image: "https://pbs.twimg.com/profile_images/1103598656949833728/wO1Y9q6v_400x400.png")
fiona = User.create(username: "Fifi1234", first_name: "Fiona", last_name: "Shrek", email: "fiona.shred@lane.com", password: "azerty", url_image: "https://i.pinimg.com/originals/53/9b/96/539b96a8ad771bbcdcf6cf078f42d862.png")
luke = User.create(username: "lukethebest", first_name: "Luke", last_name: "Skywalker", email: "luke.sky@dark.com", password: "azerty", url_image: "https://nsabers.fr/cdn/shop/articles/opolar_Luke_Skywalker_illuminated_only_by_his_green_lightsaber._69822daa-cb5f-448c-9bef-43ae2aeb19e9.png?v=1705395129")
thor = User.create(username: "thorthebest", first_name: "Thor", last_name: "Le Dieu", email: "thor.ledieu@genius.com", password: "azerty", url_image: "https://seeklogo.com/images/T/Thor-logo-7768A0A5A6-seeklogo.com.png")
geralt = User.create(username: "Yen1234", first_name: "Geralt", last_name: "De Riv", email: "geralt.deriv@witcher.com", password: "azerty", url_image: "https://www.journaldugeek.com/app/uploads/2023/06/the-witcher-critique-saison-3.jpg")
sauron = User.create(username: "RingLover", first_name: "Sauron", last_name: "Du Mordor", email: "sauron@wanadoo.fr", password: "azerty", url_image: "https://cdna.artstation.com/p/assets/images/images/045/699/384/large/anna-podedworna-sauron-posting4.jpg?1643308957")

puts "Création d'offres magiquement superbes..."

poudlard = Offer.create(name: 'Poudlard', address: 'Alnwick NE66 1NQ, United Kingdom', url_image: 'https://miro.medium.com/v2/resize:fit:1200/1*g7nlreAAvIeBMGjS9jsRWQ.jpeg', price: 100000 , description: 'Poudlard est un pensionnat pour jeunes sorcières et sorciers dirigé principalement par Albus Dumbledore, considéré comme le plus grand sorcier de sa génération', user: rogue)
sleep(5)
chateau_peach = Offer.create(name: 'Chateau de Peach', address: '10 Rockefeller Plaza, New York, New York, 10020', url_image: 'https://nintendoeverything.com/wp-content/uploads/Mario-Bros-Movie-Mushroom-Kingdom.jpg', price: 5500 , description: 'Peach est la princesse du Royaume Champignon, qui est constamment attaquée par Bowser.', user: mario)
sleep(5)
donjon_rouge = Offer.create(name: 'Donjon Rouge', address: 'Stradun 33, 20000, Dubrovnik, Croatia', url_image: 'https://cdnb.artstation.com/p/assets/images/images/012/370/613/large/steve-lund-castle-color2.jpg?1534439770', price:6000 , description:"Le Donjon Rouge est la puissante forteresse qui se dresse sur la colline d'Aegon à Port-Réal.", user: tyrion)
sleep(5)
cul = Offer.create(name: 'Cul-de-Sac', address: '1 Bagshot Row, Matamata 3472, New Zealand', url_image: 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2020/12/shire-unreal-engine-4-hobbit-hole-side-view.jpg', price:3000, description: "Ce petit trou localisé au coeur de la Comté, est la résidence de la famille Saquet, Bilbon et Frodon étant les plus connus.", user: frodon)
sleep(5)
marais = Offer.create(name: 'Marais de Shrek', address: '30 Rissington Rd, Cheltenham GL54 2AY, United Kingdom', url_image: 'https://i.redd.it/a0eke43vh7a71.jpg', price:100  , description: "Niché dans les collines des Highlands écossais, le Marais de Shrek est une oasis marécageuse, couverte de mousse et à l'eau trouble… mais surtout l'endroit idéal pour trouver la paix et la tranquillité !", user: fiona)
sleep(5)
palais = Offer.create(name: 'Palais de Jabba', address: 'P93, Tataouine, Tunisia', url_image: 'https://lumiere-a.akamaihd.net/v1/images/image_b3e570b3.jpeg?region=0,64,2413,965', price:20000  , description: "Une forteresse idéale pour malfrats et mafieux souhaitant faire de gros buffets et voir des esclaves danser", user: luke)
sleep(5)
asgard = Offer.create(name: 'Asgard', address: 'Havnegata 20, 3179 Åsgårdstrand, Norway', url_image: 'https://miro.medium.com/v2/resize:fit:1400/1*imyiyFPSFuWhI0952bLLPA.png', price:100000  , description: "Royaume paradiasque où vous pourrez vous prélasser éternellement avec dieux et deesses, et ce en compagnie du plus fort des avengers..!", user: thor)
sleep(5)
novigrad = Offer.create(name: 'Novigrad', address: '52466, Novigrad, Croatia', url_image: 'https://i.redd.it/bfydnw47tf9a1.png', price:1000  , description: "Capital de Velen, où bars à plaisirs et marchands ambulants sont nombres. Engagez aussi des witchers à l'occasion.", user: geralt)

puts "Création de commentaires plus que douteux..."

# Rogue
Review.create(content: "Le château est charmant mais un peu trop ensoleillé pour un endroit sérieux. Les ingrédients étaient moyens, mais l’ambiance est agréable.", rating: 4, user: rogue, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est parfait ! Les secrets anciens et les ingrédients rares sont un festin pour un alchimiste comme moi. Une vraie pépite.", rating: 5, user: rogue, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est aussi stimulant qu'une potion de base. Rien de notable à part une ambiance de quartier résidentiel ennuyeux.", rating: 2, user: rogue, offer: cul)
Review.create(content: "Les marais offrent quelques ingrédients uniques, mais l’environnement boueux n’est pas idéal pour préparer des potions précises.", rating: 3, user: rogue, offer: marais)
Review.create(content: "Le palais est rempli de trésors, mais la saleté et le chaos rendent le travail difficile. Malgré tout, une expérience intéressante pour un potionniste.", rating: 4, user: rogue, offer: palais)
Review.create(content: "Asgard est un paradis pour les potions ! Les ingrédients mystiques et les possibilités d’expérimentations sont infinies. Un lieu idéal pour tester mes créations.", rating: 5, user: rogue, offer: asgard)
Review.create(content: "Novigrad est animée, mais les ingrédients pour potions sont médiocres. Un endroit intéressant, mais pas une destination de choix pour mes recherches.", rating: 3, user: rogue, offer: novigrad)

# Mario

Review.create(content: "Poudlard est comme un niveau magique plein de surprises ! Les sorts et les mystères sont aussi amusants que de sauter sur des blocs.", rating: 5, user: mario, offer: poudlard)
Review.create(content: "Le Donjon Rouge est un peu trop sombre et compliqué pour moi. Je préfère les environnements plus lumineux et joyeux.", rating: 3, user: mario, offer: donjon_rouge)
Review.create(content: "Je me suis senti comme piégé dans un niveau sans fin. Il n’y a rien d’amusant ici, juste une grande déception.", rating: 1, user: mario, offer: cul)
Review.create(content: "Les marais sont farfelus et amusants. J’ai évité les grenouilles, mais c’était une sortie agréable après des aventures plus épiques.", rating: 4, user: mario, offer: marais)
Review.create(content: "Le palais est trop sale et risqué pour moi. Même les défis ne valent pas la peine de se salir les mains. Pas pour moi.", rating: 2, user: mario, offer: palais)
Review.create(content: "Asgard est absolument spectaculaire ! Les paysages sont grandioses et les aventures sont à la hauteur de mes attentes. Un vrai rêve.", rating: 5, user: mario, offer: asgard)
Review.create(content: "Novigrad est une ville vibrante avec plein d’aventures. Un peu chaotique, mais j’ai adoré explorer chaque recoin de cette ville.", rating: 4, user: mario, offer: novigrad)

# Tyrion

Review.create(content: "Poudlard est un joyau d’intrigues et de mystères. Parfait pour un esprit stratégique comme le mien, avec des secrets fascinants à chaque coin.", rating: 5, user: tyrion, offer: poudlard)
Review.create(content: "Le château est trop simple et manquant de complexité. Charmant mais pas assez intrigant pour éveiller mon intérêt.", rating: 3, user: tyrion, offer: chateau_peach)
Review.create(content: "Cul-de-sac est l’antithèse d’une bonne intrigue. Rien à découvrir ici, juste une impasse sans intérêt.", rating: 2, user: tyrion, offer: cul)
Review.create(content: "Les marais sont divertissants mais manquent de sophistication. Idéal pour une pause, mais pas pour des débats intellectuels.", rating: 3, user: tyrion, offer: marais)
Review.create(content: "Le palais est riche en personnages et en intrigues, bien que le désordre et l’odeur laissent à désirer. Intéressant mais un peu chaotique.", rating: 4, user: tyrion, offer: palais)
Review.create(content: "Asgard est un royaume impressionnant avec une profondeur stratégique remarquable. Les paysages sont majestueux et les défis, exaltants.", rating: 5, user: tyrion, offer: asgard)
Review.create(content: "Novigrad est une ville fascinante avec des intrigues à chaque coin. Chaotique mais captivant, parfait pour une exploration stratégique.", rating: 4, user: tyrion, offer: novigrad)

# Frodon

Review.create(content: "Poudlard est un lieu magique et envoûtant. Chaque recoin est rempli de mystères et d’aventures dignes d’une grande quête.", rating: 5, user: frodon, offer: poudlard)
Review.create(content: "Le château est magnifique et accueillant. Cependant, il manque un peu de l’épique que je recherche. Parfait pour une pause mais pas pour une grande aventure.", rating: 4, user: frodon, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est une épopée fascinante ! Les défis et les trésors sont à la hauteur d’une quête héroïque.", rating: 5, user: frodon, offer: donjon_rouge)
Review.create(content: "Les marais sont farfelus et amusants. Un bon endroit pour se détendre mais pas vraiment pour des aventures héroïques.", rating: 3, user: frodon, offer: marais)
Review.create(content: "Le palais est rempli de mystères et d’aventures captivantes. Un peu chaotique, mais les découvertes en valent la peine.", rating: 4, user: frodon, offer: palais)
Review.create(content: "Asgard est grandiose ! Les paysages majestueux et les aventures épiques font de cet endroit un lieu inoubliable.", rating: 5, user: frodon, offer: asgard)
Review.create(content: "Novigrad est animée et pleine de vie. Une excellente ville pour explorer, même si elle peut parfois être un peu chaotique.", rating: 4, user: frodon, offer: novigrad)

# Fiona

Review.create(content: "Poudlard est un lieu enchanteur ! Les mystères et la magie rendent chaque jour excitant et plein de surprises.", rating: 5, user: fiona, offer: poudlard)
Review.create(content: "Le château est charmant et accueillant, mais je préfère les endroits avec un peu plus de caractère et d’aventure.", rating: 4, user: fiona, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est parfait pour une aventurière comme moi. Les secrets et les défis sont palpitants. Une véritable exploration épique.", rating: 5, user: fiona, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est trop monotone et sans intérêt. Rien de fascinant ou d’aventureux à y découvrir.", rating: 2, user: fiona, offer: cul)
Review.create(content: "Le palais est rempli d’intrigues et de créatures intéressantes. Un peu chaotique, mais l’aventure est au rendez-vous.", rating: 4, user: fiona, offer: palais)
Review.create(content: "Asgard est spectaculaire ! Les paysages sont majestueux et les aventures sont à la hauteur de mes attentes. Un véritable paradis pour une aventurière.", rating: 5, user: fiona, offer: asgard)
Review.create(content: "Novigrad est vivante et pleine de surprises. Un endroit intéressant à explorer, bien que parfois un peu chaotique.", rating: 4, user: fiona, offer: novigrad)

# Luke Skywalker

Review.create(content: "Poudlard est comme un véritable terrain d’entraînement pour un Jedi ! Les mystères et les magies sont fascinants, mais je préfère les défis intergalactiques.", rating: 4, user: luke, offer: poudlard)
Review.create(content: "Le château est agréable et amusant, mais il manque un peu de la grandeur des galaxies lointaines. Idéal pour une petite escapade.", rating: 3, user: luke, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est un véritable champ de bataille ! Les défis sont intenses, mais il y a trop de ténèbres pour un Jedi.", rating: 4, user: luke, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est aussi ennuyeux qu’un désert stérile. Rien de passionnant ici, juste une impasse.", rating: 2, user: luke, offer: cul)
Review.create(content: "Les marais sont farfelus et légèrement dérangeants. Un endroit amusant pour une pause, mais pas pour une aventure épique.", rating: 3, user: luke, offer: marais)
Review.create(content: "Asgard est grandiose et digne d’une épopée intergalactique ! Les paysages majestueux et les défis sont à la hauteur de mes espérances.", rating: 5, user: luke, offer: asgard)
Review.create(content: "Novigrad est dynamique et pleine de vie. Une ville vibrante, même si elle est parfois trop chaotique pour un Jedi en quête de paix.", rating: 4, user: luke, offer: novigrad)

# Sauron

Review.create(content: "Poudlard est un château insignifiant. Les mystères sont trop basiques et les sorts sont de faible puissance. Décevant pour un Seigneur des Ténèbres.", rating: 2, user: sauron, offer: poudlard)
Review.create(content: "Le château est une forteresse ridicule. Trop de couleurs vives et aucune menace réelle. Complètement ennuyeux.", rating: 1, user: sauron, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est digne d’un seigneur maléfique. Les défis sont grands et les secrets, profonds. Un vrai terrain de jeu pour le pouvoir.", rating: 5, user: sauron, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est une impasse sans grandeur. Rien à conquérir ni à dominer. Inutile et insignifiant.", rating: 1, user: sauron, offer: cul)
Review.create(content: "Les marais sont boueux et vulgaires. Peu de potentiel pour des ambitions sombres. Décevant et misérable.", rating: 2, user: sauron, offer: marais)
Review.create(content: "Le palais est un lieu chaotique mais intrigant. Les créatures excentriques et les intrigues sont intéressantes, même si c’est sale.", rating: 4, user: sauron, offer: palais)
Review.create(content: "Asgard est un royaume puissant et majestueux. Les défis sont grands et l’ambiance est digne de la conquête. Idéal pour un maître du mal.", rating: 5, user: sauron, offer: asgard)
Review.create(content: "Novigrad est vivante mais trop chaotique. Bien pour une simple visite, mais pas assez sombre pour des plans machiavéliques.", rating: 3, user: sauron, offer: novigrad)

# Thor

Review.create(content: "Poudlard est épique ! Les sorts et les mystères sont grandioses, mais j’aurais préféré plus de combats et de gloire.", rating: 4, user: thor, offer: poudlard)
Review.create(content: "Le château est magnifique et plein de festivités ! Les défis sont amusants, et l’endroit est idéal pour se détendre après une bataille.", rating: 5, user: thor, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est digne d’un héros ! Les défis sont grands, et l’aventure est à la hauteur de la légende. Une véritable épopée.", rating: 5, user: thor, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est aussi palpitant qu’une journée pluvieuse. Aucune aventure ni défi digne de mon marteau.", rating: 2, user: thor, offer: cul)
Review.create(content: "Les marais sont amusants et farfelus. Une escapade divertissante, mais pas à la hauteur des grandes batailles.", rating: 3, user: thor, offer: marais)
Review.create(content: "Le palais est rempli d’intrigues et de chaos. Un endroit fascinant mais parfois un peu trop sombre pour ma lumière.", rating: 4, user: thor, offer: palais)
Review.create(content: "Asgard est un lieu grandiose ! Les paysages sont majestueux et les aventures sont dignes des plus grands héros.", rating: 5, user: thor, offer: asgard)

# Geralt

Review.create(content: "Poudlard est fascinant, avec ses mystères et ses sorts. Mais un peu trop de magie et pas assez de monstres à chasser.", rating: 4, user: geralt, offer: poudlard)
Review.create(content: "Le château est agréable mais un peu trop simple. Les défis sont légers, parfait pour un repos mais pas pour des aventures intenses.", rating: 3, user: geralt, offer: chateau_peach)
Review.create(content: "Le Donjon Rouge est une véritable épreuve ! Les défis sont intenses et les secrets, captivants. Idéal pour un chasseur de monstres.", rating: 5, user: geralt, offer: donjon_rouge)
Review.create(content: "Cul-de-sac est ennuyeux et sans intérêt. Aucune créature ou mystère à chasser ici, juste une grande déception.", rating: 2, user: geralt, offer: cul)
Review.create(content: "Les marais sont farfelus et amusants. Quelques créatures étranges, mais pas assez pour une vraie chasse.", rating: 3, user: geralt, offer: marais)
Review.create(content: "Le palais est rempli de mystères et de créatures intrigantes. Un endroit intéressant malgré le chaos ambiant.", rating: 4, user: geralt, offer: palais)
Review.create(content: "Asgard est époustouflant ! Les défis sont grands et les créatures sont redoutables. Un véritable terrain de chasse pour un sorceleur.", rating: 5, user: geralt, offer: asgard)
Review.create(content: "Novigrad est vivante et pleine de surprises. Une ville vibrante avec des défis intéressants, même si le chaos peut être un peu écrasant.", rating: 4, user: geralt, offer: novigrad)

#recalculating ratings for offers
puts "Giving accurate ratings to imaginary places..."

poudlard.update(rating: poudlard.reviews.sum(:rating).to_f / poudlard.reviews.count)
chateau_peach.update(rating: chateau_peach.reviews.sum(:rating).to_f / chateau_peach.reviews.count)
donjon_rouge.update(rating: donjon_rouge.reviews.sum(:rating).to_f / donjon_rouge.reviews.count)
cul.update(rating: cul.reviews.sum(:rating).to_f / cul.reviews.count)
marais.update(rating: marais.reviews.sum(:rating).to_f / marais.reviews.count)
palais.update(rating: palais.reviews.sum(:rating).to_f / palais.reviews.count)
asgard.update(rating: asgard.reviews.sum(:rating).to_f / asgard.reviews.count)
novigrad.update(rating: novigrad.reviews.sum(:rating).to_f / novigrad.reviews.count)
puts "Yahhoouuu!"
