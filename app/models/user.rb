class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, dependent: :destroy
  has_many :tickets, dependent: :destroy
  # has_many :tickets, -> { where('users.pilot' => true) }, through: :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :origin_planet,
            presence: true

end
