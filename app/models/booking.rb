class Booking < ApplicationRecord
  # belongs_to :user, optional: true
  belongs_to :car
  belongs_to :service

  validates :date, :status, presence: true
end
