class Album < ApplicationRecord
  belongs_to :artist
  has_many :lyrics # ??
  has_many :songs # ??

  validates :album_name, presence: true
  validates :album_name, uniqueness: true
end
