require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get active" do
    get :active
    assert_response :success
  end

  test "should get inactive" do
    get :inactive
    assert_response :success
  end

end
