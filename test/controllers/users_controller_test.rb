require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get users page" do
    sign_in users(:john)
    get admin_users_url
    assert_response :success
  end

  test "should get loging page" do
    get new_user_session_url
    assert_response :success
  end
end
