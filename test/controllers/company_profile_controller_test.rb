require 'test_helper'

class CompanyProfileControllerTest < ActionController::TestCase
  test "should get information" do
    get :information
    assert_response :success
  end

  test "should get promotion" do
    get :promotion
    assert_response :success
  end

  test "should get guarantee" do
    get :guarantee
    assert_response :success
  end

  test "should get facebook" do
    get :facebook
    assert_response :success
  end

end
