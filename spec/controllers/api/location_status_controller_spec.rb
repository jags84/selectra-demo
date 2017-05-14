require 'rails_helper'
require 'devise'

RSpec.describe Api::LocationStatusController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "GET #show" do
    it "returns http success" do
      get :show, format: :json, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
    it "returns 406 status without json format" do
      get :show, params: {id: 1}
      is_expected.to respond_with 406
    end
  end
end
