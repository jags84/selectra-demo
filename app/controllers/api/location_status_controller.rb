class Api::LocationStatusController < ApplicationController
  before_action :authenticate_user!
  before_action :check_format
  respond_to :json

  def show
    if Location.exists?(params[:id])
      @location = Location.find(params[:id])
    else
      # Return Not Found in case location is not found
      render json: { error: "Not Found" }
    end
  end

  private
    def check_format
      render :head => true, :status => 406 unless params[:format] == "json"
    end
end
