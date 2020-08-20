class Place < ApplicationRecord
  # Define pagination count
  paginates_per 10

  # Relations
  belongs_to :user
end
