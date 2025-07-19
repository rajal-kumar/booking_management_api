class Car < ApplicationRecord
  has_many :bookings
  validates :make, :model, :rego, presence: true
end
