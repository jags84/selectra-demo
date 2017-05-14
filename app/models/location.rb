class Location < ApplicationRecord
  has_many :location_schedules
  validates :name,:address, presence: true

  # Return if a location is open or close
  def current_status

  end

  private
    def location_params
      params.require(:location).permit(:name,:address)
    end

end
