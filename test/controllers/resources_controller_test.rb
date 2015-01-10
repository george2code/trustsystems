require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get experience" do
    get :experience
    assert_response :success
  end

  test "should get brochure" do
    get :brochure
    assert_response :success
  end

  test "should get examples" do
    get :examples
    assert_response :success
  end

  test "should get calculate" do
    get :calculate
    assert_response :success
  end

end
