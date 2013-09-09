require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { date: @schedule.date, home_id: @schedule.home_id, home_score: @schedule.home_score, time: @schedule.time, visitor_id: @schedule.visitor_id, visitor_score: @schedule.visitor_score, week: @schedule.week, winning_team_id: @schedule.winning_team_id }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    patch :update, id: @schedule, schedule: { date: @schedule.date, home_id: @schedule.home_id, home_score: @schedule.home_score, time: @schedule.time, visitor_id: @schedule.visitor_id, visitor_score: @schedule.visitor_score, week: @schedule.week, winning_team_id: @schedule.winning_team_id }
    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
