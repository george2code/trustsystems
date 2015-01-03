require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get conditions" do
    get :conditions
    assert_response :success
  end

  test "should get confidentalpolitic" do
    get :confidentalpolitic
    assert_response :success
  end

  test "should get solutionsbusiness" do
    get :solutionsbusiness
    assert_response :success
  end

end
