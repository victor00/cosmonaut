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

class_option = %w[A B C]

some_easy_passwords = %w[teste123 hamtaro42 herozero bananas peaches hashtables yougurt]

user_emails = []
email_endings = %w[@gmail.com @outlook.com @yahoo.com @hotmail.com @lewagon.com @zoho.com.br @mail.com]


# Setting emails trying to generate maximum uniques emails
puts "Setting user emails"
30.times do 
    user_emails << "#{Faker::Ancient.god}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.primordial}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.titan}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.hero}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Artist.name}_#{Faker::Superhero.prefix}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Space.constellation}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::CryptoCoin.coin_name}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
end

user_emails.uniq!


# User.pluck(:email) == User.all.map(&:email)
puts "Creating Users"
15.times do
    user_email = user_emails.sample
    user_email = user_emails.sample if User.pluck(:email).include?(user_email)
    user_planet = planets.sample
    user_planet = planets.sample if User.pluck(:origin_planet).include?(planets.sample)
    
    user = User.create(
        email: user_email,
        password: some_easy_passwords.sample,
        first_name: user_first_names.sample,
        last_name: user_last_names.sample,
        origin_planet: user_planet,
        pilot: [true, false].sample
    )

    puts "#{user.id} - User Created - #{user.email}" 
end