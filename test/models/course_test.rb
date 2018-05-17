require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "downCase course title" do
    member = Course.new(title: "course1")

    assert_not_equal "Course1", member.title
  end
end
