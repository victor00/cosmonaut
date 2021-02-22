class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips
  has_many :tickets, dependent: :destroy
  after_destroy :cleanup

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, :email, :first_name, :last_name, :origin_planet,
            presence: true

  validates :origin_planet, :email, uniqueness: true

  validates :password, confirmation: true,
                       unless: proc { |a| a.password.blank? }

  private

  def cleanup
    if pilot
      trips.destroy_all
    else
      trips.destroy
    end
  end

  def pilot?
    pilot
  end
end
