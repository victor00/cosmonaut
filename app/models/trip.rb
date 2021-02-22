class Trip < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :origin, :destination, :launch_date, :price, :max_tripulation,
            :spaceship_name, presence: true

  validates :price, numericality: true
end
