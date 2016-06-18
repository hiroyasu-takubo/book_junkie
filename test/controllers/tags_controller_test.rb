# coding: utf-8
require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  def setup
    @user = users(:hiro)
    @otheruser = users(:archer)
    @tag = tags(:Ruby)
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

  test 'should redirect create when not logged in' do
    assert_no_difference 'Tag.count' do 
      post :create, tag: { name: @tag.name }
    end
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should get edit' do
    log_in_as(@user)
    get :edit, id: @tag
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get :edit, id: @tag
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch :update, id: @tag, tag: { name: @tag.name }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@otheruser)
    patch :update, id: @tag, tag: { name: @tag.name }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test 'should redirect destroy when logged in as wrong user' do
    log_in_as(@otheruser)
    assert_no_difference 'Tag.count' do
      delete :destroy, id: @tag
    end
    assert flash.empty?
    assert_redirected_to root_url
  end
end
