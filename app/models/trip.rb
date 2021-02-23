class Trip < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  before_save :million_unit

  validates :origin, :destination, :launch_date, :price, :max_tripulation,
            :spaceship_name, presence: true

  validates :price, numericality: true

  def million_unit
    price * 1_000_000
  end
end
