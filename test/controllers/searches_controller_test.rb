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

  test 'should redirect new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should render new when keyword is blank' do
    log_in_as(@user)
    get :index, search: { keyword: '' }
    assert_not flash.empty?
    assert_template 'new'
  end  

  test 'should get index' do
    log_in_as(@user)
    get :index, search: { keyword: 'Ruby' }
    # get :index
    assert_template 'index'
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
