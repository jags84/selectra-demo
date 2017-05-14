class Location < ApplicationRecord
  has_many :location_schedules
  validates :name,:address, presence: true
end
