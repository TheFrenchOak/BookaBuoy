class Buoy < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_description_and_address,
    against: [ :name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
  SIZE = %w[ XS S M L XL XXL ]
  CATEGORY = %i[ funny luxury fashionable cute safety ridiculous boat ]
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :name, :photo, :category, :price, :size, :description, :address, presence: true
end
