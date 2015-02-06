require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  test "should get hystory" do
    get :hystory
    assert_response :success
  end

  test "should get invite_customers" do
    get :invite_customers
    assert_response :success
  end

  test "should get afs" do
    get :afs
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
