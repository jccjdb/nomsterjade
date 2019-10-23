class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocoded
  
  validates :name, :address, :description, presence: true, 
  length: { maximum: 150, minimum: 3 } 
end
