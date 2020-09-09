# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "starting to seed"

Activite.destroy_all
Entreprise.destroy_all
User.destroy_all

user = User.new(email: "laura1@gmail.com", password: "123456")

puts "Creating entreprises"

entreprise1 = Entreprise.new(nom: "Dupondland", adresse: "2 rue Paradis", jour_debut: "lundi", heure: "18h - 19h", num_siret: "12345")
entreprise1.user = user
entreprise1.save

entreprise2 = Entreprise.new(nom: "Pieland", adresse: "4 rue Paradis", jour_debut: "jeudi", heure: "14h - 20h", num_siret: "23455")
entreprise2.user = user
entreprise2.save

puts "Creating activites"

activite1 = Activite.new(nom: "Danse", address: "2 rue Paradis", description: "cours de salsa", heure: "18h - 19h", jour: "lundi et mardi", categorie: "adultes", type_activite: "danse", prix: "20e", formule: "à la séance")
activite1.entreprise = @entreprise1
activite1.save

puts "finished seed"
