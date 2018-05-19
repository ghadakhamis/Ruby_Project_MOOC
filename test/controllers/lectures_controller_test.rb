require 'test_helper'

class LecturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @lecture = lectures(:one)
  end

  test "should get new" do
    sign_in users(:one)
    get new_lecture_url
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_lecture_url(@lecture)
    assert_response :success
  end

  test "should update lecture" do
    sign_in users(:one)
    patch lecture_url(@lecture), params: { lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id } }
    assert_response :success
  end

  test "should destroy lecture" do
    sign_in users(:one)
    assert_difference('Lecture.count', -1) do
      delete lecture_url(@lecture)
    end

    assert_redirected_to lectures_url
  end
end
