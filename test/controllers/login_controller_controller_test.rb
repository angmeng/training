require 'test_helper'

class LoginControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get login_controller_create_url
    assert_response :success
  end

end
