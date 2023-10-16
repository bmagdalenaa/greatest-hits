class Artist < ApplicationRecord
  has_many :albums

  validates :artist_name, presence: true
  validates :artist_name, uniqueness: true
end
