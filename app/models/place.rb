class Place < ApplicationRecord
  # Define pagination count
  paginates_per 10

  # Relations
  belongs_to :user

  # Validation rules
  validates :lat,  presence: true, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :long, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :description, presence: true
end
