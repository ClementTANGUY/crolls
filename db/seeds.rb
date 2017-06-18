# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Combatant.delete_all
Kerangal = Combatant.create!(name: "Kerangal", life: "17", attack: "3", experience: "38", image_url: "http://www.theargonath.cc/characters/gimli/pictures/gimli9.jpg")
La_brume = Combatant.create!(name: "La Brume", life: "18", attack: "2", experience: "46", image_url: "https://www.chevalier-du-drac.com/c/43-tm_home_default/series-cultes-.jpg")
La_tige = Combatant.create!(name: "La tige", life: "15", attack: "3", experience: "29", image_url: "http://culturebox.francetvinfo.fr/sites/default/files/styles/asset_in_body_full_width/public/assets/images/2013/03/jack1.jpg")
Jeanne_la_délurée = Combatant.create!(name: "Jeanne la délurée", life: "16", attack: "4", experience: "20", image_url: "http://i40.servimg.com/u/f40/16/00/88/79/elfe_a11.jpg")
Urbus_troisième = Combatant.create!(name: "Urbus troisième", life: "18", attack: "4", experience: "30", image_url: "https://s-media-cache-ak0.pinimg.com/originals/0e/d2/18/0ed218de9823183f8ac1b77272b49713.jpg")
