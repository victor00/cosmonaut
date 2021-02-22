class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, :email, :first_name, :last_name, :origin_planet,
            presence: true

  validates :origin_planet, :email, uniqueness: true
end
