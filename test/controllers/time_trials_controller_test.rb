require 'test_helper'

class TimeTrialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_trial = time_trials(:one)
  end

  test "should get index" do
    get time_trials_url
    assert_response :success
  end

  test "should get new" do
    get new_time_trial_url
    assert_response :success
  end

  test "should create time_trial" do
    assert_difference('TimeTrial.count') do
      post time_trials_url, params: { time_trial: { email: @time_trial.email, firstname: @time_trial.firstname, lastname: @time_trial.lastname, time: @time_trial.time } }
    end

    assert_redirected_to time_trial_url(TimeTrial.last)
  end

  test "should show time_trial" do
    get time_trial_url(@time_trial)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_trial_url(@time_trial)
    assert_response :success
  end

  test "should update time_trial" do
    patch time_trial_url(@time_trial), params: { time_trial: { email: @time_trial.email, firstname: @time_trial.firstname, lastname: @time_trial.lastname, time: @time_trial.time } }
    assert_redirected_to time_trial_url(@time_trial)
  end

  test "should destroy time_trial" do
    assert_difference('TimeTrial.count', -1) do
      delete time_trial_url(@time_trial)
    end

    assert_redirected_to time_trials_url
  end
end
