require 'test_helper'

class AttendanceListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance_list = attendance_lists(:one)
  end

  test "should get index" do
    get attendance_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_attendance_list_url
    assert_response :success
  end

  test "should create attendance_list" do
    assert_difference('AttendanceList.count') do
      post attendance_lists_url, params: { attendance_list: { data: @attendance_list.data, description: @attendance_list.description } }
    end

    assert_redirected_to attendance_list_url(AttendanceList.last)
  end

  test "should show attendance_list" do
    get attendance_list_url(@attendance_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_attendance_list_url(@attendance_list)
    assert_response :success
  end

  test "should update attendance_list" do
    patch attendance_list_url(@attendance_list), params: { attendance_list: { data: @attendance_list.data, description: @attendance_list.description } }
    assert_redirected_to attendance_list_url(@attendance_list)
  end

  test "should destroy attendance_list" do
    assert_difference('AttendanceList.count', -1) do
      delete attendance_list_url(@attendance_list)
    end

    assert_redirected_to attendance_lists_url
  end
end
