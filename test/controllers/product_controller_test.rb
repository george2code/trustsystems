require 'test_helper'

class ProductControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get collect" do
    get :collect
    assert_response :success
  end

  test "should get invite" do
    get :invite
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

end
