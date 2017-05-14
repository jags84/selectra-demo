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
end
