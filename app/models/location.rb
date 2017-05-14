class Location < ApplicationRecord
  has_many :location_schedules
  validates :name,:address, presence: true

  private
    def location_params
      params.require(:location).permit(:name,:address)
    end

end
