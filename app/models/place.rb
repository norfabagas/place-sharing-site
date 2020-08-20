class Place < ApplicationRecord
  # Define pagination count
  paginates_per 5

  # Relations
  belongs_to :user
end
