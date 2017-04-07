require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get sign_in" do
    get home_sign_in_url
    assert_response :success
  end

  test "should get sign_up" do
    get home_sign_up_url
    assert_response :success
  end

end
