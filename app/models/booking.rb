class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :buoy
  has_many :bookings
  validates :start_date, :end_date, :status, presence: true
end
