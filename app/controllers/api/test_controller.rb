module Api
  class TestController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:UpdateUserLocation]

  def UpdateUserLocation
    json_data = params["_json"].first # Get the first object in the "_json" array
    user_location_params = {
      accuracy: json_data["accuracy"],
      deviceName: json_data["deviceName"],
      latitude: json_data["latitude"],
      longitude: json_data["longitude"],
      provider: json_data["provider"],
      time: json_data["time"]
    }

    puts(user_location_params)
    user_location = UserLocation.new(user_location_params)

    if user_location.save
      render json: { status: 'SUCCESS', message: 'Saved user location', data: user_location }, status: :ok
    else
      render json: { status: 'ERROR', message: 'User location not saved', data: user_location.errors }, status: :unprocessable_entity
    end
  end

  def getJourneyTrack
    user_locations = UserLocation.all
    render json: { status: 'SUCCESS', message: 'Loaded user locations', data: user_locations }, status: :ok
  end

  def deleteLocationData
    UserLocation.delete_all
    render json: { status: 'SUCCESS', message: 'Deleted all user locations' }, status: :ok
  end

  private

  def user_location_params
    params.require(:user_location).permit(:latitude, :longitude, :provider, :accuracy, :time, :deviceName)
  end
  end
end