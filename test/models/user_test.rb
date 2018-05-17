require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "downcase email address" do
    member = User.new(email: "john.Doe@example.com")

    assert_equal "john.Doe@example.com", member.email
  end

end
