class Location < ApplicationRecord
  has_many :location_schedules, dependent: :destroy
  validates :name,:address, presence: true

  # Return if a location is open or close
  def current_status
    # Get current day and time
    current_day = Date.today.wday
    current_time = Tod::TimeOfDay.parse(Time.now.strftime("%H:%M:%S"))
    # Get current day schedule
    schedule = self.location_schedules[current_day]
    open_time = Tod::TimeOfDay.parse(schedule.open_time)
    close_time = Tod::TimeOfDay.parse(schedule.close_time)
    # Verify if location is open
    (open_time <= current_time) && (current_time <= close_time) ? 'open' : 'close'
  end

  private
    def location_params
      params.require(:location).permit(:name,:address)
    end

end
