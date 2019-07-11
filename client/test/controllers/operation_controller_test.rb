require 'test_helper'

class OperationControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get operation_check_url
    assert_response :success
  end

end
