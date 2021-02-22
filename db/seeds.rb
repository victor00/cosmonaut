# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

spaceship_names = [
    "Tardis", "Bebop", "Apollo", "Ares", "Nimbus", "X-Wing",
    "Destroyer", "Millennium Falcon", "Galactic Empire", "Space Cruiser",
    "Discovery", "Starship Enterprise", "U.S.S Enterprise"
]

planets = [
    "Venzenulon 9", "Gazorpazorp", "Cromulon", "Tatooine", "Mustafar",
    "Mandalore", "Earth", "Nal Hutta", "Corellia", "Moon", "Mars",
    "Alderaan", "Endor", "Ahch-To", "Omicron Persei 8", "Wormulon", "Xenotaph 3",
    "Igloopiter", "Mercury", "Venus", "Jupiter", "Saturn", "Uranus",
    "Neptune", "Amateru", "Dagon"
]

user_first_names = [
    "Victor", "Guilherme", "Atila", "William", "Rafael", "Roberto", "Admar",
    "Fernando", "Mariana", "Matheus", "Beatriz", "Camila", "Gustavo", "Pedro",
    "João", "Kayo", "Marcelo", "Ed", "Gabriel", "Felipe", "Leonardo",
    "Lucas", "Yoda", "Anakim", "Rick", "Morty", "Han", "Luke",
    "Chewbacca", "BB-8", "Boba", "R2-D2", "Jango", "Finn", "Kylo",
    "Leia", "Jerry", "Frank", "Trevor", "Michael", "Lamar", "Tanisha",
    "Kennedy", "Abraham", "Kennedy", "Houston", "Spike", "Hank", "Marie",
    "Jesse", "Lucy", "Candance", "Ferb", "Kenny", "Eric", "Stan", "Buzz",
    "Hermione", "Harry", "Marvin", "Severus", "Arthur"
]

user_last_names = [
    "Skywalker", "Solo", "Fett", "Baba", "Nest", "Dameron", "Jinn",
    "Ackbar", "Ren", "Emperor", "The Hut", "Maul", "Kenobi", "Smith",
    "Sanchez", "Phillips", "Myers", "Ocean", "Lamar", "Spiegel", "Paul",
    "Roiland", "McCormick", "Broflovski", "Cartman", "Marsh", "Lightyear",
    "Chef", "Slave", "Granger", "Malfoy", "Snape", "Lee", "Wood",
    "Williams", "Davis", "Mei", "Garcia", "Nguyen", "Carter", "Dumbledore",
    "Snyde", "Snape", "Dent", "Perfect", "Beeblebrox", "Slartibartfast"
]

user_emails = []

15.times do 
    user_emails << "#{Faker::Ancient.god}@gmail.com"
    user_emails << "#{Faker::Ancient.primordial}@outlook.com"
    user_emails << "#{Faker::Ancient.titan}@yahoo.com"
    user_emails << "#{Faker::Ancient.hero}@hotmail.com"
end

user_emails.uniq!
