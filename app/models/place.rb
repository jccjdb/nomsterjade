class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos
  geocoded_by :address
  after_validation :geocode
  
  validates :name, :address, :description, presence: true, 
  length: { maximum: 150, minimum: 3 } 
end
