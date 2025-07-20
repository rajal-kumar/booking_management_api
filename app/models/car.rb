class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :make, :model, :rego, presence: true
end
