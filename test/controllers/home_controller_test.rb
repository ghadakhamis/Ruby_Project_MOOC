require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should not get index" do
    get root_url
    assert_response 302
  end
  test "should get index" do
    sign_in_as users(:one)
    get root_url
    assert_response :success
  end

end
