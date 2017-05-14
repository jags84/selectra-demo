class LocationSchedule < ApplicationRecord
  belongs_to :location
  validates :day, :open_time, :close_time, :location, presence: true
  # Days of the week
  WEEK_DAYS = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

  # Return all week days
  def self.get_week_days
    WEEK_DAYS
  end

  # Set week schedule for a location
  def self.set_schedule(location,schedule)
    location.location_schedules.delete_all
    WEEK_DAYS.each do |week_day|
      loc_schedule = LocationSchedule.new
      loc_schedule.day = week_day
      loc_schedule.open_time = schedule["#{week_day}_open_hour"]
      loc_schedule.close_time = schedule["#{week_day}_close_hour"]
      loc_schedule.location = location
      loc_schedule.save
    end
  end

  private
    def location_schedule_params
      params.require(:location_schedule).permit(:day, :open_time, :close_time, :location)
    end

end
