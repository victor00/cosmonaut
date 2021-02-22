class Ticket < ApplicationRecord
  CLASS_OPTIONS = %w[A B C]

  belongs_to :user
  belongs_to :trip

  validates :user, presence: true
  validates :trip, presence: true

  validates :class_option, inclusion: { in: CLASS_OPTIONS }

  validates_uniqueness_of :user, scope: :trip
end
