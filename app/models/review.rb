class Review < ApplicationRecord
  belongs_to :booking

  RATINGS = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5] }
end
