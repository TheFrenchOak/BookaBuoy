class Buoy < ApplicationRecord
  SIZE = %w[ XS S M L XL XXL ]
  CATEGORY = %i[ funny luxury fashionable cute safety ridiculous boat ]
  belongs_to :user
  has_many :bookings
  validates :name, :photo, :category, :price, :size, :address, presence: true
end
