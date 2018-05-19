require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    @lecture = lectures(:one)
  end
  test "should get edit" do
    sign_in users(:one)
    get  edit_lecture_comment_url(@lecture,@comment)
    assert_response :success
  end
  test "should destroy comment" do
    sign_in users(:one)
    assert_difference('Comment.count', -1) do
      delete lecture_comment_url(@comment,@lecture)
    end
    assert_redirected_to lecture_url(@lecture)  
  end 
  # test "the truth" do
  #   assert true
  # end
end
