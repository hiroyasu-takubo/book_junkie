require 'test_helper'

class SearchesControllerTest < ActionController::TestCase

  def setup
    @user = users(:hiro)
    @otheruser = users(:archer)
  end

  test 'should get new' do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test 'should render new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
