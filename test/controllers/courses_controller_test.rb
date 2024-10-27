require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_courses_create_url
    assert_response :success
  end

  test "should get update" do
    get api_courses_update_url
    assert_response :success
  end
end
