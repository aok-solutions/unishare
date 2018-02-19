require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get rides_url
    assert_response :success
  end

  test "should get new" do
    get new_ride_url
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post rides_url, params: { ride: { arrival: @ride.arrival, departure: @ride.departure, destination: @ride.destination, pickup: @ride.pickup, seats: @ride.seats } }
    end

    assert_redirected_to ride_url(Ride.last)
  end

  test "should show ride" do
    get ride_url(@ride)
    assert_response :success
  end

  test "should get edit" do
    get edit_ride_url(@ride)
    assert_response :success
  end

  test "should update ride" do
    patch ride_url(@ride), params: { ride: { arrival: @ride.arrival, departure: @ride.departure, destination: @ride.destination, pickup: @ride.pickup, seats: @ride.seats } }
    assert_redirected_to ride_url(@ride)
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete ride_url(@ride)
    end

    assert_redirected_to rides_url
  end
end
