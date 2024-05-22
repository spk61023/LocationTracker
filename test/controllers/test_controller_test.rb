require "test_helper"

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get UpdateUserLocation" do
    get test_UpdateUserLocation_url
    assert_response :success
  end

  test "should get getJourneyTrack" do
    get test_getJourneyTrack_url
    assert_response :success
  end
end
