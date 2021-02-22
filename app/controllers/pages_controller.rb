class PagesController < ApplicationController
  def home
  end

  spaceship_names = [
    "tardis", "bebop", "apollo", "ares", "nimbus", "x-wing",
    "destroyer", "millennium falcon", "galactic empire", "space cruiser",
    "discovery", "starship enterprise", "U.S.S enterprise"
  ]
  planets = [
    "Venzenulon 9", "Gazorpazorp", "Cromulon", "Tatooine", "Mustafar",
    "Mandalore", "Earth", "Nal Hutta", "Corellia", "Moon", "Mars",
    "Alderaan", "Endor", "Ahch-To", "Omicron Persei 8", "Wormulon", "Xenotaph 3",
    "Igloopiter", "Mercury", "Venus", "Jupiter", "Saturn", "Uranus",
    "Neptune", "Amateru", "Dagon"
  ]
end
