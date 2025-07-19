class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  belongs_to :service

  validates :date, :status, presence: true
end
