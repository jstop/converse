require 'test_helper'

class ScheduleZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_zone = schedule_zones(:one)
  end

  test "should get index" do
    get schedule_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_zone_url
    assert_response :success
  end

  test "should create schedule_zone" do
    assert_difference('ScheduleZone.count') do
      post schedule_zones_url, params: { schedule_zone: { payload: @schedule_zone.payload } }
    end

    assert_redirected_to schedule_zone_url(ScheduleZone.last)
  end

  test "should show schedule_zone" do
    get schedule_zone_url(@schedule_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_zone_url(@schedule_zone)
    assert_response :success
  end

  test "should update schedule_zone" do
    patch schedule_zone_url(@schedule_zone), params: { schedule_zone: { payload: @schedule_zone.payload } }
    assert_redirected_to schedule_zone_url(@schedule_zone)
  end

  test "should destroy schedule_zone" do
    assert_difference('ScheduleZone.count', -1) do
      delete schedule_zone_url(@schedule_zone)
    end

    assert_redirected_to schedule_zones_url
  end
end
