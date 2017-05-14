class LocationSchedule < ApplicationRecord
  belongs_to :location
  validates :day, :open_time, :close_time, :location, presence: true
  WEEK_DAYS = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

  # Return all week days
  def self.get_week_days
    WEEK_DAYS
  end

end
