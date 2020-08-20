class Place < ApplicationRecord
  # Define pagination count
  paginates_per 10

  # Relations
  belongs_to :user

  # Validation rules
  validates :lat, presence: true
  validates :long, presence: true
  validates :description, presence: true
end
