require 'rails_helper'
require 'devise'

RSpec.describe Api::LocationStatusController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user
  render_views

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, params: {id: 1}
      expect(response).to have_http_status(:success)
    end

    it "returns 406 status without json format" do
      get :show, params: {id: 1}
      is_expected.to respond_with 406
    end

    it "must return location status and location name" do
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
      get :show, format: :json, params: {id: location.id}
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to match({"location_status" => 'open',"location_name" => 'Location Name'})
    end

  end
end
