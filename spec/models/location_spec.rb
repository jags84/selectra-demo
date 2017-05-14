require 'rails_helper'

RSpec.describe Location, type: :model do
  subject {
    described_class.new(name: "My Location Name", address: "My Location Address")
  }

  describe "Record Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = ""
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = ""
      expect(subject).to_not be_valid
    end
  end

  describe "Methods Validations" do
    it "current_status must have open value" do
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
      expect(location.current_status).to eq('open')
    end
  end
end
