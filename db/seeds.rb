# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Dropping database"

User.destroy_all
Trip.destroy_all
Ticket.destroy_all

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

spaceship_photos = [
      "spaceship1.png", "spaceship2.png", "spaceship3.png",
      "spaceship4.png", "spaceship5.png", "spaceship6.png",
      "spaceship7.png", "spaceship8.png", "spaceship9.jpeg"
    ]

class_options = ["First Class", "Executive Class", "Economic Class"]

some_easy_passwords = "123123"

user_emails = []
email_endings = %w[
                    @gmail.com @gmail.com.br @outlook.com @outlook.com.br @yahoo.com @yahoo.com.br 
                    @hotmail.com @lewagon.com @lewagon.com.br @zoho.com @zoho.com.br @mail.com @mail.com.br
                  ]


# Setting emails trying to generate maximum uniques emails
puts "Setting user emails"
100.times do 
    user_emails << "#{Faker::Ancient.god}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.primordial}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.titan}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Ancient.hero}_#{Faker::Space.constellation}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Artist.name}_#{Faker::Superhero.prefix}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::Space.constellation}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
    user_emails << "#{Faker::CryptoCoin.coin_name}_#{Faker::Ancient.hero}#{email_endings.sample}".gsub(" ", "")
end

user_emails.map!(&:downcase)
user_emails.uniq!

# User.pluck(:email) == User.all.map(&:email)
puts "Creating Users\n"
50.times do
    user_email = user_emails.sample
    user_email = user_emails.sample until (User.pluck(:email).exclude?(user_email))
  
    user = User.create!(
        email: user_email,
        password: some_easy_passwords,
        first_name: user_first_names.sample,
        last_name: user_last_names.sample,
        origin_planet: planets.sample,
        pilot: rand(100) < 50
    )

    puts "\n#{user.id} - User Created - #{user.email}\n"
    puts "_" * 55
end

puts "Setting up Date"
current_date = Time.now
# date_now = Date.now.parse('%d-%m-%Y')

puts "Creating Trips\n"
20.times do 
    origin_planet_start = planets.sample
    destination_planet_diff = planets.sample
    destination_planet_diff = planets.sample until origin_planet_start != destination_planet_diff

    user_const = User.where(pilot: true).sample

    trip = Trip.create!(
        origin: origin_planet_start,
        destination: destination_planet_diff,
        launch_date: current_date,
        user: user_const,
        price: rand(1..20),
        max_tripulation: rand(1..10),
        spaceship_name: spaceship_names.sample
        # spaceship_photo: spaceship_photos.sample
    )
   
    
    current_date += 1.day
    current_date += 10.year
    puts "\n#{trip.id} - Trip Created - Ready to launch at: #{trip.launch_date}\n"
    puts "_" * 55
end

def unique_user(user_sample, trip_sample)
    # if Ticket.pluck(:user_id).include?(user_sample.id) 
    if user_sample.tickets.include?(trip_sample.id)
        # Ticket.pluck(:trip_id).include?(trip_sample.id)
        unique_user(User.all.sample, Trip.all.sample)
    end
    [user_sample, trip_sample]
end

puts "Creating Tickets\n"
Trip.all.each do |trip|

    rand(0..trip.max_tripulation).times do
        trip.reload
        user = User.where.not(id: trip.user_ids).sample
        ticket = Ticket.create!(
            user: user,
            trip: trip,
            class_option: class_options.sample,
            rating: rand(1..5)
        )
    
        puts "\n#{ticket.id} - Ticket Created \n"
        puts "_" * 55
    end    
end

