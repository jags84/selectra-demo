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
end
