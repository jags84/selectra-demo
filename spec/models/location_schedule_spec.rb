require 'rails_helper'

RSpec.describe LocationSchedule, type: :model do
  subject {
    described_class.new(day: "Sunday", open_time: "08:00", close_time: "23:00", location: FactoryGirl.create(:location))
  }

  describe "Record Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a day" do
      subject.day = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a open_time" do
      subject.open_time = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a close_time" do
      subject.close_time = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without a location" do
      subject.location = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Methods Validations" do
    it "should have 7 schedules for 1 location" do
      location = FactoryGirl.create(:location)
      schedule = {
        "Sunday_open_hour"=>"06:00",
        "Sunday_close_hour"=>"23:00",
        "Monday_open_hour"=>"06:00",
        "Monday_close_hour"=>"23:00",
        "Tuesday_open_hour"=>"06:00",
        "Tuesday_close_hour"=>"23:00",
        "Wednesday_open_hour"=>"06:00",
        "Wednesday_close_hour"=>"23:00",
        "Thursday_open_hour"=>"06:00",
        "Thursday_close_hour"=>"23:00",
        "Friday_open_hour"=>"06:00",
        "Friday_close_hour"=>"23:00",
        "Saturday_open_hour"=>"06:00",
        "Saturday_close_hour"=>"23:00"
      }
      LocationSchedule.set_schedule(location,schedule)
      location.reload
      expect(location.location_schedules.count).to eq(7)
    end
    
    it "must return 7 days of the week" do
      expect(LocationSchedule.get_week_days.count).to eq(7)
    end
  end
end
