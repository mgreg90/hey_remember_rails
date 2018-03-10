class LocationController < ApplicationController

  def create
    @location = current_user.locations.new(create_location_params)
    if @location.save
      respond_to do |format|
        format.json { render json: @location, status: :created }
      end
    else
      respond_to do |format|
        error = {message: "POST request to /locations failed!"}
        format.json { render json: error, status: :bad_request }
      end
    end
  end

  private

  def create_location_params
    args.permit(:longitude, :latitude)
  end
end
