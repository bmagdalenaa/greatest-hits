class Album < ApplicationRecord
  belongs_to :artist
  has_many :lyrics # ??
  has_many :songs # ??
end
