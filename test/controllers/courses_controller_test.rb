require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @course = courses(:one)
  end

  test "should get new" do
    sign_in users(:one)
    get new_course_url
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    sign_in users(:one)
    patch course_url(@course), params: { course: { title: @course.title, user_id: @course.user_id } }
    assert_response :success
  end

  test "should destroy course" do
    sign_in users(:one)
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
