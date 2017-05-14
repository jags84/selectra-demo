require 'rails_helper'
require 'devise'

RSpec.describe LocationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "GET #index" do
    it "returns a success response" do
      location = FactoryGirl.create_list(:location,1)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      location = FactoryGirl.create(:location)
      get :show, params: {id: location.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      location = FactoryGirl.create(:location)
      get :edit, params: {id: location.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          location = FactoryGirl.build(:location)
          post :create, params: {location: {name: location.name, address: location.address}, schedule: {
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
          }}
        }.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        location = FactoryGirl.build(:location)
        post :create, params: {location: {name: location.name, address: location.address}, schedule: {
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
        }}
        expect(response).to redirect_to(Location.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        location = FactoryGirl.build(:location)
        location.name = ""
        post :create, params: {location: {name: location.name, address: location.address}}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested location" do
        location = FactoryGirl.create(:location)
        put :update, params: {id: location.id, location: {name: "Updated Name"}, schedule: {
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
        }}
        location.reload
        expect(location.name).to eq("Updated Name")
      end

      it "redirects to the location" do
        location = FactoryGirl.create(:location)
        put :update, params: {id: location.id, location: {name: "Updated Name"}, schedule: {
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
        }}
        expect(response).to redirect_to(location)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        location = FactoryGirl.create(:location)
        put :update, params: {id: location.id, location: {name: ""}, schedule: {
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
        }}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = FactoryGirl.create(:location)
      expect {
        delete :destroy, params: {id: location.to_param}
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = FactoryGirl.create(:location)
      delete :destroy, params: {id: location.to_param}
      expect(response).to redirect_to(locations_url)
    end
  end

end
